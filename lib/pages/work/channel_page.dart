import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utils/key_chain.dart';

class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  static const MethodChannel channel = const MethodChannel('channel_page');

  String show_oc_text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通道页面'),
      ),
      body: ListView(
        children: [
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(show_oc_text.toString()),
                  FlatButton(
                    child: Text("存储数据_oc"),
                    onPressed: () {
                      KeyChain.set(key: 'name', value: 'jim').then((onValue) {
                        print("onValue == ${onValue.toString()}");
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("读取数据_oc"),
                    onPressed: () {
                      KeyChain.get(key: 'name').then((onValue) {
                        print("读取数据onValue == ${onValue.toString()}");
                        Object object;
                        print(" >>>>>>>> ${object}");
                        setState(() {
                          show_oc_text = onValue;
                        });
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("清除数据_oc"),
                    onPressed: () {
                      KeyChain.remove(key: 'name').then((onValue) {
                        print("移除数据 onValue == ${onValue.toString()}");
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
