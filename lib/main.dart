import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/controller/event/global_const.dart';
import 'package:untitled/controller/router/router_util.dart';
import 'package:untitled/controller/store/index.dart';
import 'package:untitled/model/config_state_model.dart';
import 'package:untitled/pages/home/home_page.dart';

void main() {
  /// 配置路由
  RouterUtil.initRoutes();
  runApp(Store.init(child: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    /// build完成
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (mounted) {
        _overlayEntry();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  获取Provide状态
    return Store.connect<ConfigModel>(builder: (context, child, model) {
      return MaterialApp(
        theme: ThemeData(primaryColor: Colors.green),
        home: MyHomePage(),
        //配置两个国际化的参数
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale("zh", "CH"),
          //const Locale("en", "US")
        ],
      );
    });
  }

  /// 全局浮层
  void _overlayEntry() {
    var btn = Material(
      color: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.green,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: GestureDetector(
        child: Container(
          width: 80,
          height: 80,
          color: Colors.transparent,
          child: Icon(Icons.add),
        ),
        onTap: () {
          print('add==========');
        },
      ),
    );

    double OffsetY = 200;
    ValueNotifier<Offset> offsetNotifier =
        ValueNotifier<Offset>(Offset(0, OffsetY));
    var entry = OverlayEntry(
        maintainState: true,
        builder: (BuildContext context) {
          return ValueListenableBuilder(
            valueListenable: offsetNotifier,
            builder: (BuildContext context, Offset value, Widget child) {
              return Positioned(
                top: value.dy > 0 ? value.dy : 0,
                left: value.dx > 0 ? value.dx : 0,
                child: Draggable(
                    //创建可以被拖动的Widget
                    child: btn,
                    //拖动过程中的Widget
                    feedback: btn,
                    //拖动过程中，在原来位置停留的Widget，设定这个可以保留原本位置的残影，如果不需要可以直接设置为Container()
                    childWhenDragging: Container(),
                    //拖动结束后的Widget
                    onDraggableCanceled: (Velocity velocity, Offset offset) {
                      //更新位置信息
                      offsetNotifier.value = offset;
                    }),
              );
            },
          );
        });
    navigatorStateKey?.currentState?.overlay?.insert(entry);
  }
}
