
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/utils/alert_util.dart';


class OtherListViewFunctionPage extends StatefulWidget {
  @override
  _OtherListViewFunctionPageState createState() => _OtherListViewFunctionPageState();
}

class _OtherListViewFunctionPageState extends State<OtherListViewFunctionPage> {

  @override
  void initState() {
    super.initState();
    var permission =  PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);
  }

  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = List();

  _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
      rootWidgetKey.currentContext.findRenderObject();

      /// 设备分辨率
      double pixelRatio = window.devicePixelRatio;
      var image = await boundary.toImage(pixelRatio: pixelRatio);

      /// png格式
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      String result = await ImageGallerySaver.saveImage(pngBytes); //这个是核心的保存图片的插件
      print(result);
      showCupertinoCertainAlert(
          context: context, title: result != '' ? '保存成功' : '保存失败');
      return pngBytes;
    } catch (e) {
      print('截图失败 = $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'listview拼接,子禁止滚动',
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("截图"),
            onPressed: () {
              _capturePng();
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
          //future: _netData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("等待..."),
              );
            } else {
              print("snapshot.data = ${snapshot.data}");
              /// 截图  ListView.builder 必须包裹一层滚动的视图,比如SingleChildScrollView
              return SingleChildScrollView(
                child: RepaintBoundary(
                  ///截图需要的key
                  key: rootWidgetKey,
                  child: Container(
                    height: 500,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Text('22'),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 100,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 20,
                                  child: Text('内容 - $index')
                                );
                              }),
                        ),
                        Text('33'),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}



