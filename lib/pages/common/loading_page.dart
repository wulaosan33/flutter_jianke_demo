import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/controller/event/event_declaration.dart';
import 'package:untitled/controller/event/loading_event.dart';
import 'package:untitled/controller/router/router_util.dart';
import 'package:untitled/utils/log_util.dart';

StreamSubscription initLoadingDialog(BuildContext context) {
  LogUtil.get().w('初始化监听------------------------Loading---------------------');
  StreamSubscription _streamLoading =
      eventBus.on<LoadingEvent>().listen((event) {
    try {
      ///当前没有加载中展示,且展示标识为否的时候
      if (event.showFlag) {
        LogUtil.get().i('准备显示Loading信息');
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return LoadingDialog();
            });
      } else {
        LogUtil.get().i('准备关闭Loading信息');
        RouterUtil.pop(context);
      }
    } catch (e) {
      LogUtil.get().w('准备显示loading时发现页面被销毁了,就不处理了');
    }
  });
  return _streamLoading;
}

class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    LogUtil.get().i('显示Loading信息');
    return new Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
          width: 120,
          height: 60,
          child: Opacity(
            opacity: 1.0,
            child: Container(
              ///弹框背景和圆角
              decoration: ShapeDecoration(
                color: Colors.transparent,
                image: new DecorationImage(

                    ///此处缺少一个加载的gif图
                    image: new ExactAssetImage('')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // new CircularProgressIndicator(),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    // child: new Text(text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
