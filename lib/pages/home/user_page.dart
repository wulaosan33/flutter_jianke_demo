import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/home/drawer_view.dart';
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

  // ignore: non_constant_identifier_names
  /*_userPageAppBar() {
    double tabHeight =
        MediaQueryData.fromWindow(window).padding.top + kToolbarHeight + 30;
    return PreferredSize(
      preferredSize: Size.fromHeight(tabHeight),
      child: Container(
        height: tabHeight,
        color: Colors.green,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/touxiang.jpg',
                          ),
                        )),
                    margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top + 10, left: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }*/

  _userPageAppBar(){
    return AppBar(
      title: Text(""),
    );
  }

  // ignore: non_constant_identifier_names
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


