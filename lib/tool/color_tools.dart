import 'dart:ui';

import 'package:flutter/material.dart';

//app标题背景
final appBarColor = LinearGradient(
  colors: [Colors.green, Colors.greenAccent],
);

//颜色
final backBlue = Color(0xFF0070E4);

final backColorC = Color(0xFFCCCCCC);

final backColor9 = Color(0xFF999999);

final fontColor3 = Color(0xFF333333);



//全局字体样式
final TextStyle textStyleBlackBold16 = TextStyle(color: Color(0xFF333333),fontSize: 16,fontWeight: FontWeight.bold);

final TextStyle textStyleBlack16 = TextStyle(color: Color(0xFF333333),fontSize: 16);

final TextStyle textStyleBlack14 = TextStyle(color: Color(0xFF333333),fontSize: 14);

final TextStyle textStyleBlack12 = TextStyle(color: Color(0xFF333333),fontSize: 12);

final TextStyle textStyleGrey16 = TextStyle(color: Color(0xFF999999),fontSize: 16);

final TextStyle textStyleGrey14 = TextStyle(color: Color(0xFF999999),fontSize: 14);

final TextStyle textStyleGrey12 = TextStyle(color: Color(0xFF999999),fontSize: 12);


// error错误提示隐藏
final errorTextStyle = TextStyle(
  inherit:false,
  letterSpacing:-12,
  height: 0,
  fontSize: 1,
);