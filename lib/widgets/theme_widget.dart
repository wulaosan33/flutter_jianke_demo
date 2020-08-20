import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ThemeWidget(double mSize, String themeName, String imagePath,) {
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap: () {

        },
        child: Container(
          height: 150,
          width: mSize / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath),
                /*填充方式*/
                fit: BoxFit.cover,
                /*磨砂效果*/
                colorFilter: ColorFilter.mode(
                  Colors.red[50].withOpacity(0.6),
                  BlendMode.hardLight,
                )),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(themeName),
      )
    ],
  );
}


