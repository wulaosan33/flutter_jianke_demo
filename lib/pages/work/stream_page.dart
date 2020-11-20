import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  StreamSubscription _streamSubscription;

  StreamController<String> _streamController;

  StreamSink _streamSink;

  Future<String> futureData() async {
    await Future.delayed(Duration(seconds: 3));
    return "Stream 返回结果";
  }

  _StreamController_futureData() async {
    await Future.delayed(Duration(seconds: 3));
    _streamController.add("_streamController 返回结果 ${Random().nextInt(100)}");
  }

  String textData = "";

  String _streamControllerData = "_streamControllerData";

  StreamController<String> _streamController2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamController2 = StreamController.broadcast();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
    _streamController2.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamPage'),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.orange,
            child: Column(
              children: <Widget>[
                Text("Stream 每次创建新对象,完成一次监听,StreamSubscription 可取消,暂停"),
                Text(textData),
                FlatButton(
                  child: Text("Stream按钮"),
                  onPressed: () async {
                    /// 应该就是异步
                    Stream<String> _stream = Stream.fromFuture(
                      /// 定义 Future
                      Future.delayed(Duration(seconds: 1), () {
                        return "Stream 返回的结果是 ${Random().nextInt(100)}";
                      }),
                    );

                    _streamSubscription = _stream.listen((data) {
                      debugPrint("StreamData = $data");
                      setState(() {
                        textData = data;
                      });
                    }, onError: (error) {
                      debugPrint("StreamData = $error");
                    }, onDone: () {
                      debugPrint("StreamData = 完成了");
                    });
                  },
                ),
                FlatButton(
                  child: Text("取消监听,无重新监听"),
                  onPressed: () {
                    _streamSubscription.cancel();
                  },
                ),
                FlatButton(
                  child: Text("暂停监听"),
                  onPressed: () {
                    _streamSubscription.pause();
                  },
                ),
                FlatButton(
                  child: Text("恢复监听"),
                  onPressed: () {
                    _streamSubscription.resume();
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            color: Colors.greenAccent,
          ),
          Column(
            children: <Widget>[
              Text("创建StreamController 一个实例,多次add,只能一次订阅"),
              Text(_streamControllerData),
              FlatButton(
                child: Text("创建StreamController"),
                onPressed: () {
                  /// 应该就是异步
                  _streamController = StreamController<String>();

                  /// 只能订阅一次
                  _streamController.stream.listen((data) {
                    debugPrint("_streamControllerData = $data");
                    setState(() {
                      _streamControllerData = data;
                    });
                  }, onError: (error) {
                    debugPrint("StreamData = $error");
                  }, onDone: () {
                    debugPrint("StreamData = 完成了");
                  });
                },
              ),
              FlatButton(
                child: Text("添加数据"),
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 1));

                  _streamController
                      .add("_streamController 返回结果 ${Random().nextInt(100)}");
                },
              ),
              FlatButton(
                child: Text("_streamController 关闭"),
                onPressed: () {
                  _streamController.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              Text("StreamSink 一个实例,多次add 监听数据"),
              Text(_streamControllerData),
              FlatButton(
                child: Text("创建StreamController"),
                onPressed: () {
                  _streamController = StreamController<String>();
                  _streamSink = _streamController.sink;

                  _streamController.stream.listen((data) {
                    debugPrint("_streamControllerData = $data");
                    setState(() {
                      _streamControllerData = data;
                    });
                  }, onError: (error) {
                    debugPrint("StreamData = $error");
                  }, onDone: () {
                    debugPrint("StreamData = 完成了");
                  });
                },
              ),
              FlatButton(
                child: Text("添加数据"),
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 1));
                  _streamSink
                      .add("_streamController 返回结果 ${Random().nextInt(100)}");
                },
              ),
              Divider(
                color: Colors.red,
              ),
              Text("多次订阅 StreamController.broadcast()"),
              Text(_streamControllerData),
              FlatButton(
                child: Text("多次订阅"),
                onPressed: () {
                  /// 应该就是异步
                  _streamController = StreamController.broadcast();
                  _streamController.stream.listen((data) {
                    debugPrint("_streamControllerData订阅1 = $data");
                    setState(() {
                      _streamControllerData = data;
                    });
                  }, onError: (error) {
                    debugPrint("StreamData = $error");
                  }, onDone: () {
                    debugPrint("StreamData = 完成了");
                  });
                  _streamController.stream.listen((data) {
                    debugPrint("_streamControllerData订阅2 = $data");
                    setState(() {
                      _streamControllerData = data;
                    });
                  }, onError: (error) {
                    debugPrint("StreamData = $error");
                  }, onDone: () {
                    debugPrint("StreamData = 完成了");
                  });
                },
              ),
              FlatButton(
                child: Text("添加数据"),
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 1));
                  _streamController
                      .add("_streamController 返回结果 ${Random().nextInt(100)}");
                  _streamController.stream.listen((data) {
                    debugPrint("_streamControllerData订阅3 = $data");
                  }, onError: (error) {
                    debugPrint("StreamData = $error");
                  }, onDone: () {
                    debugPrint("StreamData = 完成了");
                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              Text("StreamBuilder Text 根据值确定显示,就不用全局变量了"),
              StreamBuilder(
                stream: _streamController2.stream,
                initialData: "初始值",
                builder: (context, asyncSnapshot) {
                  return Text("${asyncSnapshot.data}");
                },
              ),
              FlatButton(
                child: Text("添加数据"),
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 1));
                  _streamController2
                      .add("_streamController 返回结果 ${Random().nextInt(100)}");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
