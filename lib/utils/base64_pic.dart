import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 显示base64码图片
class Base64Image extends StatelessWidget {
  String base64Str;
  double radius;
  double width;
  double heigth;

  Base64Image(this.base64Str, {this.width,this.heigth,this.radius = 10,});

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = Base64Decoder().convert(base64Str);
    Widget  avatar = Image.memory(bytes,fit: BoxFit.cover,width: width,height: heigth,);
    return new ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: avatar,
    );
  }
}
