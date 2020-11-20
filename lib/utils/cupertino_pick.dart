import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/controller/router/router_util.dart';

//文件选择回调
typedef void FilePickCallback(List<File> result);

class DictSelectPage extends StatefulWidget {
  @override
  _DictSelectPageState createState() => _DictSelectPageState();
}

class _DictSelectPageState extends State<DictSelectPage> {
  @override
  Future initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请选择'),
        elevation: 1.0,
      ),
      body: Builder(
          builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
              child: Container())),
    );
  }
}

class CupertinoPick {
  static pickImage(BuildContext context, FilePickCallback callback,
      {bool multipleFlag = false}) {
    if (multipleFlag) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: const Text('拍照'),
                  onPressed: () async {
                    File image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    if (null != image) {
                      List<File> fileList = List<File>();
                      fileList.add(image);
                      callback(fileList);
                    }
                    RouterUtil.pop(context);
                  },
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('取消'),
                isDefaultAction: true,
                onPressed: () {
                  RouterUtil.pop(context);
                },
              ),
            );
          });
    } else {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: const Text('拍照'),
                  onPressed: () async {
                    File image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    if (null != image) {
                      List<File> fileList = List<File>();
                      fileList.add(image);
                      callback(fileList);
                    }
                    RouterUtil.pop(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text('选取照片'),
                  onPressed: () async {
                    File image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (null != image) {
                      List<File> fileList = List<File>();
                      fileList.add(image);
                      callback(fileList);
                    }
                    RouterUtil.pop(context);
                  },
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('取消'),
                isDefaultAction: true,
                onPressed: () {
                  RouterUtil.pop(context);
                },
              ),
            );
          });
    }
  }
}
