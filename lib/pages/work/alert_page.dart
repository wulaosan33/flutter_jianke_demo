import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utils/alert_util.dart';
import 'package:untitled/utils/base64_pic.dart';
import 'package:untitled/utils/cupertino_pick.dart';
import 'package:untitled/utils/toast/toast.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage>
    with SingleTickerProviderStateMixin {
  List<String> imageList = new List();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List _isExpandedList = [false, false];
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('弹窗'),
      ),
      body: ListView(
        children: [
          _flatButton('Android 弹窗', () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text('弹窗'),
                  children: <Widget>[
                    SimpleDialogOption(
                      child: Text('选项1'),
                      onPressed: () {
                        Navigator.pop(context, '选择了1');
                      },
                    ),
                  ],
                );
              },
            );
          }),

          blankBox(),

          _flatButton('全屏', () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        ///弹框背景和圆角
                        decoration: ShapeDecoration(
                          color: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // new CircularProgressIndicator(),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                              ),
                              // child: new Text(text),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),

          blankBox(),

          _flatButton('Android alert', () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('标题'),
                    content: Text('是否'),
                    actions: <Widget>[
                      _flatButton('确定', () {
                        Navigator.pop(context);
                      }),
                      _flatButton('取消', () {
                        Navigator.pop(context);
                      }),
                    ],
                  );
                });
          }),

          blankBox(),

          _flatButton('ios alert', () {
            showCupertinoAlert(context: context, title: '标题', message: '内容');
          }),

          blankBox(),

          _flatButton('ios sheet', () {
            showCupertinoSheet(
              context: context,
              title: '标题',
              message: '内容',
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  child: Text('相机'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text('相册'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }),

          blankBox(),

          _flatButton('自定义 sheet', () {
            showContentSheet(
              context: context,
              content: Container(
                  height: 100,
                  child: Center(
                    child: Text('自定义内容1'),
                  )),
            );
          }),
          blankBox(),

          Column(
            children: [
              FlatButton(
                child: Text('相机'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  CupertinoPick.pickImage(context, (List<File> file) async {
                    if (file.isNotEmpty) {
                      for (var planet in file) {
                        var imgBase64 =
                            base64Encode(await planet.readAsBytes());
                        setState(() {
                          imageList.add(imgBase64);
                        });
                      }
                    }
                  }, multipleFlag: false);
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //每行显示三个图片
                        crossAxisSpacing: 10.0, //水平间距
                        mainAxisSpacing: 10.0, //垂直间距
                        childAspectRatio: 1.0, //子Widget宽高比例
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return imgItem(
                            index,
                            imageList,
                            NumUtil.divide(
                                NumUtil.subtract(
                                    MediaQuery.of(context).size.width, 60.0),
                                3.0));
                      }))
            ],
          ),

          blankBox(),

          Column(
            children: <Widget>[
              TextField(),
              _flatButton('Toast.success', () {
                Toast.success(
                    context: context,
                    dismissDuration: Duration(seconds: 2),
                    callBack: () {
                      print('Toast.success');
                    });
              }),
              _flatButton('Toast.failure', () {
                Toast.failure(
                    context: context,
                    dismissDuration: Duration(seconds: 3),
                    callBack: () {
                      print('Toast.failure');
                    });
              }),
              _flatButton('Toast.error', () {
                Toast.error(
                    context: context,
                    callBack: () {
                      print('Toast.error');
                    });
              }),
              _flatButton('Toast.showToast-1', () {
                var toast = Toast.showToast(
                    context: context,
                    child: Text('showToast-1'),
                    autoDismiss: false,
                    callBack: () {
                      print('Toast.success');
                    });

                Future.delayed(Duration(seconds: 3)).whenComplete(() {
                  toast.dismissToast();
                });
              }),
              _flatButton('Toast.showToast-2', () {
                var toast = Toast.showToast(
                    context: context,
                    child: Text('showToast-2'),
                    autoDismiss: false,
                    callBack: () {
                      print('Toast.success');
                    });

                Future.delayed(Duration(seconds: 4)).whenComplete(() {
                  toast.dismissToast();
                });
              }),
              _flatButton("Toast.dismissToast-1", () {}),
              _flatButton("Toast.dismissToast-2", () {}),
              _flatButton("Toast.loading", () {
                var toast = Toast.loading(context: context);
                var current = 0;
                Timer.periodic(Duration(milliseconds: 500), (timer) {
                  current += 1;
                  var progress = current / 100;
                  print('progress= $progress');
                  toast.loadingProgress = progress;
                  if (progress == 1) {
                    toast.loadingPop();
                    timer.cancel();
                  }
                });
              }),
            ],
          ),

          blankBox(),

          _flatButton('自定义 sheet 时间', () {
            showDateSheet(context: context);
          }),

          blankBox(),

          _flatButton('会消失的', () {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('Are you talkin\' to me?'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(label: "确定", onPressed: () {}),
              ),
            );
          }),

          _ShowSnackBar(),

          blankBox(),

          /// 上下收缩 展开
          ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                debugPrint(
                    ' panelIndex = $panelIndex  isExpanded = $isExpanded');
                _isExpandedList[panelIndex] = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text('A'),
                  );
                },
                body: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListBody(
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text('我是内容'),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('我是内容'),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('我是内容'),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('我是内容'),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('我是内容'),
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: _isExpandedList[0],
              ),
            ],
          ),

          blankBox(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _animationController.forward(),
                child: Text('展示'),
              ),
              RaisedButton(
                onPressed: () => _animationController.reverse(),
                child: Text('消失'),
              ),
            ],
          ),

          ///不要被这个组件的名字迷惑了，它本质上是一个SlideTransition组件，
          ///从（0，1）移动到（0，0）
          CupertinoFullscreenDialogTransition(
            linearTransition: false,
            primaryRouteAnimation: _animationController,
            secondaryRouteAnimation: _animationController,
            child: Container(
              color: Colors.orange,
              height: 50,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget imgItem(index, imageList, imageWH) {
    if (imageList.length > 0 && ObjectUtil.isNotEmpty(imageList[index])) {
      return GestureDetector(
        child: Container(
          child: Offstage(
            offstage: ObjectUtil.isEmpty(imageList[index]),
            child: Base64Image(
              imageList[index],
              width: imageWH,
              heigth: imageWH,
            ),
          ),
        ),
        onTap: () {
          print(imageList[index]);
        },
      );
    } else {
      return Container();
    }
  }

  Widget _flatButton(String text, VoidCallback callback) {
    return FlatButton(
      child: Text(text),
      splashColor: Colors.red,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: callback,
    );
  }

  Widget blankBox() {
    return Container(
      height: 20,
    );
  }
}

///floatingActionButton: Builder( //当BuildContext在Scaffold之前时，
///调用Scaffold.of(context)会报错。这时可以通过Builder Widget来解决
class _ShowSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('会消失的'),
      splashColor: Colors.red,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('消失'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            action: SnackBarAction(label: '确定', onPressed: () {}),
          ),
        );
      },
    );
  }
}
