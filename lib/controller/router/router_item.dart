import 'package:flutter/material.dart';

class RouterItem {
  /// 路由标题
  String routerTitle;

  /// 路由路径
  String routerPath;

  /// 组件
  Widget widget;

  /// 该路由是否需要登录
  bool needLogin;

  ///
  String provideModel;

  RouterItem(this.routerPath, this.widget,
      {this.routerTitle,  this.provideModel = ''});
}
