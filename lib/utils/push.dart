import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// push
Future<T> push<T>({
  @required BuildContext context,
  @required Widget widget,
  rootNavigator = true,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator).push(
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
  );
}

/// push 跳转并当前页面为根视图
Future<T> pushAndRemoveUntil<T>({
  @required BuildContext context,
  rootNavigator = true,
  Widget widget,
}) {
//  return Navigator.pushAndRemoveUntil(context,
//      MaterialPageRoute(builder: (context) {
//        return widget;
//      }), (route) => route == null);

  return Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
    return widget;
  }), (route) => route == null);
}

/// push 跳转并替换当前页面
Future<T> pushReplacement<T>({
  @required BuildContext context,
  rootNavigator = true,
  Widget widget,
}) {
//  return Navigator.pushReplacement(context,
//      MaterialPageRoute(builder: (context) {
//        return widget;
//      }));

  return Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
  );
}

/// pop
/// [result]返回结果
pop<T>(
  BuildContext context, [
  T result,
]) {
  Navigator.pop(context, result);
}

///[rootNavigator] 是否隐藏 底部bottomBar 默认隐藏
Future<T> pushCupertino<T>({
  @required BuildContext context,
  bool rootNavigator = true,
  Widget widget,
}) {
  /// 需要配合使用 iOS风格push
  return Navigator.of(context, rootNavigator: rootNavigator).push(
    CupertinoPageRoute(builder: (context) {
      return widget;
    }),
  );
}

/// pushName 跳转页面
Future<T> pushName<T>({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
  bool rootNavigator,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator)
      .pushNamed(routeName, arguments: arguments);
}

/// pushNamedAndRemoveUntil 跳转页面
Future<T> pushNamedAndRemoveUntil<T>({
  @required BuildContext context,
  @required String routeName,
  @required RoutePredicate predicate,
  Object arguments,
  bool rootNavigator,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator)
      .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
}

/// pushReplacementNamed 跳转页面
Future<T> pushReplacementNamed<T extends Object, TO extends Object>({
  @required BuildContext context,
  @required String routeName,
  @required RoutePredicate predicate,
  Object arguments,
  TO result,
  bool rootNavigator,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator)
      .pushReplacementNamed(routeName, result: result, arguments: arguments);
}

/// pushName 获得参数
T pushNameOfArguments<T extends Object>({
  @required BuildContext context,
}) {
  return ModalRoute.of(context).settings.arguments;
}
