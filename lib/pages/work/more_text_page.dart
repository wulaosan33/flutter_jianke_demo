import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreTextPage extends StatefulWidget {
  @override
  _MoreTextPageState createState() => _MoreTextPageState();
}

class _MoreTextPageState extends State<MoreTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('多行文本页面'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text("Flexible"),
              Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAssssssssssss",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(backgroundColor: Colors.red),
                      maxLines: 1,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(backgroundColor: Colors.orange),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(50),
          ),
          Column(
            children: [
              Text("Expanded"),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(backgroundColor: Colors.red),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(backgroundColor: Colors.orange),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
                      style: TextStyle(backgroundColor: Colors.purple),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(50),
          ),
          Row(children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child: new Text('红色按钮'),
            ),
            new Expanded(
              flex: 1,
              child: new RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child: new Text('黄色按钮'),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child: new Text('粉色按钮'),
            ),
          ]),
          SizedBox.fromSize(
            size: Size.fromHeight(50),
          ),
          Row(children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child: new Text('红色按钮'),
            ),
            new Flexible(
              flex: 1,
              child: new RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child: new Text('黄色按钮'),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child: new Text('粉色按钮'),
            ),
          ]),
        ],
      ),
    );
  }
}
