import 'dart:async';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/controller/event/event_declaration.dart';
import 'package:untitled/controller/router/router_util.dart';
import 'package:untitled/pages/common/loading_page.dart';
import 'package:untitled/utils/alert_util.dart';
import 'package:untitled/utils/log_util.dart';


///公共父页面
// ignore: must_be_immutable
class CommonEventPage extends StatefulWidget {
  Widget childWidget;

  CommonEventPage(this.childWidget);

  @override
  _CommonEventPageState createState() => new _CommonEventPageState();
}

class _CommonEventPageState extends State<CommonEventPage> {
  StreamSubscription _streamLoading;

  @override
  void initState() {
    eventBus = new EventBus();
    super.initState();
    _streamLoading = initLoadingDialog(context);
  }

  @override
  void dispose() {
    super.dispose();
    _streamLoading != null ? _streamLoading.cancel() : {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.childWidget,
    );
  }
}

///处理双击了两次返回,处理公共的事件监听
// ignore: must_be_immutable
class CommonParentLessWidget extends StatelessWidget {
  Widget childWidget;

  CommonParentLessWidget(this.childWidget);

  DateTime lastPopTime;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    // TODO: implement build
    if (Platform.isIOS) {
      return Container(
        child: childWidget,
      );
    } else {
      return WillPopScope(
        child: childWidget,
        onWillPop: _requestPop,
      );
    }
  }

  Future<bool> _requestPop() async {
    // 点击返回键的操作
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
      bool backFlag = Navigator.canPop(_context);
      if (null != backFlag && !backFlag) {
        lastPopTime = DateTime.now();
        LogUtil.get().i('当前页面已经没得返回了,准备退出吧');
        Alert('再按一次退出');
      } else {
        RouterUtil.pop(_context);
        return false;
      }
    } else {
      lastPopTime = DateTime.now();
      // 退出app
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }

    return true;
  }
}

///处理双击了两次返回,处理公共的事件监听
// ignore: must_be_immutable
class CommonParentWidget extends StatefulWidget {
  Widget childWidget;

  CommonParentWidget(this.childWidget);

  @override
  _CommonParentWidgetState createState() => new _CommonParentWidgetState();
}

class _CommonParentWidgetState extends State<CommonParentWidget> {
  DateTime lastPopTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (Platform.isIOS) {
      return Container(
        child: widget.childWidget,
      );
    } else {
      return WillPopScope(
        child: widget.childWidget,
        onWillPop: _requestPop,
      );
    }
  }

  Future<bool> _requestPop() async {
    // 点击返回键的操作
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
      bool backFlag = Navigator.canPop(context);
      if (null != backFlag && !backFlag) {
        lastPopTime = DateTime.now();
        LogUtil.get().i('当前页面已经没得返回了,准备退出吧');
        Alert('再按一次退出');
      } else {
        RouterUtil.pop(context);
        return false;
      }
    } else {
      lastPopTime = DateTime.now();
      // 退出app
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }

    return true;
  }
}
