import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///网络错误提醒
Alert(message, {int code}) {
  switch (code) {
    case ErrorCode.NETWORK_ERROR:
      Fluttertoast.showToast(msg: "网络异常", gravity: ToastGravity.CENTER);
      break;
    case 401:
      Fluttertoast.showToast(msg: "权限异常", gravity: ToastGravity.CENTER);
      break;
    case 403:
      Fluttertoast.showToast(msg: "403异常", gravity: ToastGravity.CENTER);
      break;
    case 404:
      Fluttertoast.showToast(msg: "网络地址错误", gravity: ToastGravity.CENTER);
      break;
    case ErrorCode.NETWORK_TIMEOUT:
      //超时
      Fluttertoast.showToast(msg: "请求超时", gravity: ToastGravity.CENTER);
      break;
    default:
      Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
      break;
  }
}

///错误编码
class ErrorCode {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    return message;
  }
}

/// iOS风格

///  alert 只有一个
Future<T> showCupertinoCertainAlert<T>({
  @required BuildContext context,
  String title,
  String message,
  VoidCallback certainCallback,
  String certainText = "确定",
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: (title != null && title.isNotEmpty) ? Text(title) : null,
          content:
              (message != null && message.isNotEmpty) ? Text(message) : null,
          actions: <Widget>[
            _flatButton(
              certainText,
              style: TextStyle(color: Colors.deepPurple),
              callback: () {
                Navigator.pop(context);
                if (certainCallback != null) {
                  certainCallback();
                }
              },
            ),
          ],
        );
      });
}

///  alert
Future<bool> showCupertinoAlert({
  @required BuildContext context,
  String title,
  String message,
  VoidCallback certainCallback,
  String certainText = "确定",
  VoidCallback cancelCallback,
  String cancelText = "取消",
}) {
  return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: (title != null && title.isNotEmpty) ? Text(title) : null,
          content:
              (message != null && message.isNotEmpty) ? Text(message) : null,
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                cancelText,
              ),
              onPressed: () {
                Navigator.pop(context, false);
                if (cancelCallback != null) {
                  cancelCallback();
                }
              },
            ),
            CupertinoDialogAction(
              child: Text(certainText),
              onPressed: () {
                Navigator.pop(context, true);
                if (certainCallback != null) {
                  certainCallback();
                }
              },
            ),
          ],
        );
      });
}

// ignore: slash_for_doc_comments
/**
    CupertinoActionSheetAction(
    child: Text("相机"),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
 **/

///  sheet
Future<T> showCupertinoSheet<T>({
  @required BuildContext context,
  String title,
  String message,
  VoidCallback cancelCallback,
  String cancelText = "取消",
  List<CupertinoActionSheetAction> actions,
}) {
  return showCupertinoModalPopup(
      context: context,
      semanticsDismissible: true,
      builder: (context) {
        return CupertinoActionSheet(
          title: (title != null && title.isNotEmpty) ? Text(title) : null,
          message:
              (message != null && message.isNotEmpty) ? Text(message) : null,
          cancelButton: CupertinoActionSheetAction(
            child: Text(cancelText),
            onPressed: () {
              Navigator.pop(context);
              if (cancelCallback != null) {
                cancelCallback();
              }
            },
          ),
          actions: actions,
        );
      });
}

///  自定义内容sheet
Future<T> showContentSheet<T>(
    {@required BuildContext context, Widget content}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return content;
      });
}

///  时间选择器
Future<T> showDateSheet<T>({
  @required BuildContext context,
}) {
  return showContentSheet(
      context: context,
      content: Container(
        height: 300,
      ));
}

///
_flatButton(String text, {VoidCallback callback, TextStyle style}) {
  return FlatButton(
    child: Text(text, style: style),
    onPressed: callback,
  );
}
