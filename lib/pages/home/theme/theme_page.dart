import 'package:flutter/material.dart';
import 'package:untitled/widgets/theme_widget.dart';

/// 主题换肤页
class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    double mSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _themeAppbar(),
      body: _themeBody(mSize),
    );
  }

  _themeAppbar() {
    return AppBar(
      title: Text("主题"),
      centerTitle: true,
    );
  }

  _themeBody(double mSize) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ThemeWidget(mSize, "粉色", "assets/images/pinkPic.jpg"),
              ThemeWidget(mSize, "绿色", "assets/images/pinkPic.jpg"),
              ThemeWidget(mSize, "黑色", "assets/images/pinkPic.jpg"),
            ],
          ),
        ],
      ),
    );
  }
}
