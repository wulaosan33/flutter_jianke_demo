import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _workPageAppBar(),
      body: _workPageBody(),
    );
  }

  _workPageAppBar() {
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
                  onTap: () {},
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
                    margin: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(window).padding.top + 10, left: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _workPageBody() {
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
