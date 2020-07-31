import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/dev/myProject/untitled/lib/widgets/drawer_view.dart';
import 'package:untitled/tool/color_tools.dart';

/// 用户页
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _userPageAppBar(),
      drawer: DrawerView(),
      body: _userPageBody(),
    );
  }

  _userPageAppBar(){
    return AppBar(
      title: Text(""),
    );
  }

  _userPageBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(

          )
        ],
      ),
    );
  }



}


