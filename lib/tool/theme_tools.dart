import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeRouteDemo extends StatefulWidget {
  @override
  _ThemeRouteDemoState createState() => _ThemeRouteDemoState();
}

class _ThemeRouteDemoState extends State<ThemeRouteDemo> {

  Color _themeColor = Colors.green; //当前路由主题色


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,//用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor),//用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ThemeData实现路由换肤'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.pregnant_woman),
                Text(' 颜色跟随主题'),
              ],
            ),

            //给第二行Icon自定义颜色（固定为某个颜色）
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.orange,
                ),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.send),
                  Icon(Icons.explore),
                  Text(' 颜色固定橘黄色'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              setState(() =>
              _themeColor = _themeColor==Colors.green ? Colors.orange : Colors.green,
              ),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
