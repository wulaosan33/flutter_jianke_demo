import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBarItem extends StatefulWidget {
  final String buttonText;
  final IconData buttonIcon;

  CustomTabBarItem(this.buttonText, this.buttonIcon, {Key key})
      : super(key: key);

  @override
  _CustomTabBarItemState createState() => _CustomTabBarItemState();
}

class _CustomTabBarItemState extends State<CustomTabBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(widget.buttonText),
          ),
          Container(
            child: Icon(widget.buttonIcon),
          )
        ],
      ),
    );
  }
}
