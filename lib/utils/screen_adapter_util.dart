import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 屏幕适配
 */
class ScreenAdapterUtil{

  static init(context){
    ScreenUtil.init(context, designSize: Size(375, 667));
  }
  static height(double value){
     return ScreenUtil().setHeight(value);
  }
  static width(double value){
      return ScreenUtil().setWidth(value);
  }
  static getScreenHeight(){
    return ScreenUtil().screenHeight;
  }
  static getScreenWidth(){
    return ScreenUtil().screenWidth;
  }

  static getScreenPxHeight(){
    return ScreenUtil().screenHeightPx;
  }
  static getScreenPxWidth(){
    return ScreenUtil().screenWidthPx;
  }

  static size(double value){
   return ScreenUtil().setSp(value);
  }

}
