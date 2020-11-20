import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartPage extends StatefulWidget {
  @override
  _RxDartPageState createState() => _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {
  String textData = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose = ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Text("Observable 把以前的 Stream放入"),
              Text(textData),
              FlatButton(
                child: Text("Stream按钮"),
                onPressed: () async {
                  List<String> list = [
                    "Stream 返回结果 ${Random().nextInt(100)}",
                    "Stream 返回结果 ${Random().nextInt(100)}"
                  ];

                  /// 应该就是异步
                  Stream<List> _stream = Stream.fromFuture(
                    /// 定义 Future
                    Future.delayed(Duration(seconds: 1), () {
                      return [
                        "Stream 返回结果 ${Random().nextInt(100)}",
                        "Stream 返回的结果是 ${Random().nextInt(100)}"
                      ];
                    }),
                  );
                  //Observable<List> _observable = Observable(_stream);
                  /// fromIterable 放入一个list,listen 会根据list长度 多次订阅
                  //Observable<String> _observable = Observable(Stream.fromIterable(['hello','你好','张三']));
                  /// fromFuture
                  /*Observable _observable = Observable.fromFuture(
                    /// 定义 Future
                    Future.delayed(Duration(seconds: 1), () {
                      return "Stream 返回结果 ${Random().nextInt(100)}";
                    }),
                  );*/
                  /// 可迭代的类 list Set
                  Observable _observable = Observable.fromIterable([
                    "Stream 返回结果 ${Random().nextInt(100)}",
                    "Stream 返回结果 ${Random().nextInt(100)}"
                  ]);

                  /// 只有一个数据 T
                  //Observable _observable = Observable.just(list);
                  _observable.listen((data) {
                    debugPrint("StreamData = $data");
                  });
                  _observable = Observable.just("list");
                  _observable.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("重复触发,根据内容关闭,不可以关闭"),
                onPressed: () {
                  /// 重复触发
                  /*Observable _periodic =
                      Observable.periodic(Duration(seconds: 1), (count) {
                    return "返回给: $count";
                  }).listen((data) {
                    debugPrint("StreamData = $data");
                  }) as Observable;*/
                  /// 这个也是间隔,但
                  var obs = Observable(Stream.fromIterable([1, 2, 3, 4, 5]))
                      .interval(Duration(seconds: 1));
                  obs.listen((data) {
                    textData = data.toString();
                    print("data = ${data}");
                    setState(() {});
                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("吐出数据”后间隔一段时间再吐下一个数据。"),
                onPressed: () {
//                  Stream stream  = Stream.fromIterable([1, 2, 3, 4, 5]);
                  Stream stream = Stream.fromFuture(Future.value("jim"));
                  /* Stream stream  = Stream.fromFuture( Future.delayed(Duration(seconds: 1), () {
                    return "tom";
                  }));*/
                  var obs = Observable(stream).interval(Duration(seconds: 1));
                  obs.listen((data) {
                    print("data = ${data}");
                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("PublishSubject重复,且可关闭"),
                onPressed: () async {
                  /*
                ///类不对
                PublishSubject _subject = PublishSubject<String>().listen((data) {
                    debugPrint("StreamData2 = $data");
                  })
                  as PublishSubject..interval(Duration(seconds: 1));*/

                  /* Observable observable = Observable(Stream.fromIterable([1, 2, 3, 4, 5]));
                  observable.startWith(9).listen(print);
                  Observable ob =PublishSubject().interval(Duration(seconds: 1));
                  ob.listen((data) {
                    debugPrint("StreamData1 = $data");
                  });*/

                  /// 放中间,后面的监听不到
                  PublishSubject _subject = PublishSubject();
                  _subject.listen((data) {
                    debugPrint("StreamData1 = $data");
                  });

                  Future.delayed(Duration(seconds: 4), () {
                    print("aaaaa");
                    _subject.close();
                  });
                  _subject.add("jim");
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("PublishSubject"),
                onPressed: () {
                  PublishSubject _subject = PublishSubject();
                  _subject.listen((data) {
                    debugPrint("StreamData = $data");
                  });

                  /// 放中间,后面的监听不到
                  _subject.add("jim");
                  _subject.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });
                  _subject.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child:
                    Text("5--BehaviorSubjec,add后listen 也可以监听,2个add,不同位置不同效果"),
                onPressed: () {
                  BehaviorSubject _subject = BehaviorSubject(onListen: () {
                    print("被监听");
                  });

                  _subject.listen((data) {
                    debugPrint("StreamData1 = $data");
                  });

                  /// 这个放中间,不同位置不同效果
                  ///  BehaviorSubject add 后面的listen 只能被监听最后add的
                  ///  _subject在add后,之前的就会被替换,越在后面越晚被替换

                  _subject.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });

                  _subject.listen((data) {
                    debugPrint("StreamData3 = $data");
                  });
                  _subject.add("tom");
                  _subject.add("jim");

                  _subject.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("ReplaySubject,2个add后listen 也可以监听"),
                onPressed: () {
                  ///maxSize 直接接收最后的2个
                  ReplaySubject _subject = ReplaySubject<String>(maxSize: 2);

                  /// 这个放中间,不同位置不同效果

                  _subject.listen((data) {
                    debugPrint("StreamData = $data");
                  });
                  _subject.add("jim");
                  _subject.add("tom");
                  _subject.add("jack");
                  _subject.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });

                  _subject.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("转map-拦截一下"),
                onPressed: () {
                  ///可以对数据进行添加截取
                  /*PublishSubject _subject = PublishSubject() ;
                  _subject.map((item){
                  return "拦截一下 $item";
                  }).listen((data) {
                    debugPrint("StreamData = $data");
                  });*/

                  /* /// 语法[这种写法有问题，转的类不正确]
                     PublishSubject _subject = PublishSubject().map((item){
                    return "拦截一下 $item";
                  }).listen((data) {
                    debugPrint("StreamData = $data");
                  }) as PublishSubject;*/

                  /* ///在where后可以根据条件确认返回什么,过滤一下自己想要的
                     PublishSubject _subject = PublishSubject<String>()
                    ..where((item){
                      print(item);
                      return item=="jim";
                    }).map((item) {
                      print("map $item");
                      return "拦截一下 $item";
                    }).listen((data) {
                      debugPrint("StreamData = $data");
                    });
*/

                  ///take
                  //如果你想要控制这个流最多能传多少个东西。比如输入密码，我们可能想让用户最多输四次，
                  // 那么我们可以使用take来限制
                  /* PublishSubject _subject = PublishSubject<String>()
                      ..take(4).map((item) {
                        print("map $item");
                        return "拦截一下 $item";
                      }).listen((data) {
                        debugPrint("StreamData = $data");
                      });*/

                  ///transform
                  //如果你需要更多的控制转换，那么请使用transform()方法。
                  /*StreamTransformer<int,String> transformer = StreamTransformer<int,String>.fromHandlers(
                        handleData:(value, sink){
                          if(value== 100){
                            sink.add("你猜对了");
                          }
                          else{ sink.addError('还没猜中，再试一次吧');
                          }
                        });

                    PublishSubject _subject = PublishSubject<int>()
                      ..transform(transformer).listen(
                            (data) => print(data),
                        onError:(err) => print(err));*/

                  PublishSubject _subject = PublishSubject<String>()
                    ..debounceTime(Duration(seconds: 5)).listen((data) {
                      debugPrint("${DateTime.now()} StreamData = $data");
                    });

                  /// 这个放中间,不同位置不同效果
                  //_subject.add("jim");
                  //_subject.add(["jim1","jim1"]);
//                    _subject.add("jim1");
//                    _subject.add("jim2");
//                    _subject.add("jim3");
//                    _subject.add("jim4");
                  //_subject.add(1);
                  _subject.sink.add(100);

                  /// 需要关闭,不然有警告
                  _subject.close();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
