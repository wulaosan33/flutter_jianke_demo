import 'package:fluttertoast/fluttertoast.dart';

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
