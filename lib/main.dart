import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
}
