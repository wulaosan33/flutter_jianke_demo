import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSavePage extends StatefulWidget {
  @override
  _LocalSavePageState createState() => _LocalSavePageState();
}

class _LocalSavePageState extends State<LocalSavePage> {
  String name = "1";
  String allValue = "1";

  // 需要设置Scaffold的key才能弹出SnackBar
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地存储'),
      ),
      // 设置key处理SnackBar，这里一定要设置，否则弹窗不显示
      key: _scaffoldkey,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(name.toString()),
                  FlatButton(
                    child: Text("存储数据"),
                    onPressed: () {
                      Future<SharedPreferences> prefs =
                          SharedPreferences.getInstance();
                      prefs.then((onValue) {
                        onValue.setString("name", "小明");
                      }).whenComplete(() {
                        _scaffoldkey.currentState.showSnackBar(SnackBar(
                          content: Text('set succssed'),
                          duration: Duration(milliseconds: 100),
                        ));
                        // 下面这种方法是不可用的(当BuildContext在Scaffold之前时，调用Scaffold.of(context)会报错)
                        // Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("读取数据"),
                    onPressed: () {
                      SharedPreferences.getInstance().then((onValue) {
                        print(
                            "onValue.getString(mUserName)=   ${onValue.getString("name")}");
                        setState(() {
                          name = onValue.getString("name");
                        });
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("清除数据"),
                    onPressed: () {
                      SharedPreferences.getInstance().then((onValue) {
                        onValue.remove("name");
                        setState(() {
                          name = onValue.getString("name");
                        });
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(allValue.toString()),
                  FlatButton(
                    child: Text("存储另一个数据"),
                    onPressed: () {
                      Future<SharedPreferences> prefs =
                          SharedPreferences.getInstance();
                      prefs.then((onValue) {
                        onValue.setString("age", "12");
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("读取所有数据"),
                    onPressed: () {
                      SharedPreferences.getInstance().then((onValue) {
                        print("读取所有数据 = ${onValue.getKeys()}");
                        List<String> list = List();

                        onValue.getKeys().forEach((key) => {
                              list.add(onValue.get(key)),
                            });

                        print("list = ${list}");

                        setState(() {
                          allValue = list.toString();
                        });
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("清除所有数据"),
                    onPressed: () {
                      SharedPreferences.getInstance().then((onValue) {
                        onValue.clear();

                        ///清除所有
                        setState(() {
                          allValue = onValue.getKeys().toString();
                        });
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
