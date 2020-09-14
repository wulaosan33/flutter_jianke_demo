import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  var _duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
            onPressed: () {
              showModal<void>(
                context: context,
                builder: (BuildContext context) {
                  return _DetailPage();
                },
              );
            },
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            child: const Text('弹出对话框'),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 4),
        itemBuilder: (context, index) {
          return OpenContainer(
            transitionDuration: _duration,//设置时间
            //tappable:false,--------设为false则点击不会显示大图
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return Container(
                child: Image.asset(
                  'assets/images/IMG_3601.JPG',
                  fit: BoxFit.fitWidth,
                ),
              );
            },
            openBuilder: (BuildContext context, VoidCallback _) {
              return _DetailPage();
            },
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/IMG_3601.JPG',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}