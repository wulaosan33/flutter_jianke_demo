import 'dart:async';
import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/controller/router/router_item.dart';
import 'package:untitled/pages/common/common_parent_page.dart';
import 'package:untitled/pages/home/home_page.dart';
import 'package:untitled/pages/home/theme/theme_page.dart';
import 'package:untitled/provider/provider_config.dart';
import 'package:untitled/utils/common_tool.dart';
import 'package:untitled/utils/log_util.dart';

//系统级路由
// ignore: non_constant_identifier_names
final String MAIN = "/";

// ignore: non_constant_identifier_names
final String THEME_PAGE = '/themePage/';

class RouterUtil {
  static Router router = new Router();
  static List<RouterItem> routerItemList = [
    RouterItem(MAIN, MyHomePage(), routerTitle: "系统级主页面"),
    RouterItem(THEME_PAGE, ThemePage(), routerTitle: "主题换肤页面"),
  ];

  /// 跳转到系统路由
  static Future navigateTo(BuildContext context, String routerPath,
      {bool replace = false, bool clearStack = false}) async {

    Completer completer = Completer();
    Future future = completer.future;

    LogUtil.get().d("跳转到路径$routerPath");
    future = router.navigateTo(context, routerPath,
        transition: TransitionType.native,
        replace: replace,
        clearStack: clearStack);
    return future;
  }

  ///返回上个页面
  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  ///返回上个页面 通过导航刷新
  static popRefresh(BuildContext context) {
    Navigator.of(context).pop(true);
  }

  ///返回上个页面 刷新指定页面
  static popRefreshPage(BuildContext context) {
    Navigator.pop(context);
    CommonTools.instance.refreshSubject.add(true);
  }

  ///返回上个页面 刷新指定页面 并传值
  static popRefreshPageWithData(BuildContext context, DataModel model) {
    Navigator.pop(context);
    CommonTools.instance.refreshWithDataSubject.add(model);
  }

  ///返回指定页面  refresh 刷新
  static popToPage(BuildContext context, String routerURL, bool refresh,
      {bool routerParam = false}) {
    if (routerParam) {
      routerURL = CommonTools.instance.getRouterUrl(routerURL);
    }
    Navigator.popUntil(context, ModalRoute.withName(routerURL));
    CommonTools.instance.refreshSubject.add(refresh);
  }

  ///返回指定页面 并带数据 刷新
  static popToPageWithData(
      BuildContext context, String routerURL, DataModel model,
      {bool routerParam = false}) {
    if (routerParam) {
      routerURL = CommonTools.instance.getRouterUrl(routerURL);
    }
    Navigator.popUntil(context, ModalRoute.withName(routerURL));
    CommonTools.instance.refreshWithDataSubject.add(model);
  }

  ///  配置路由信息
  static void initRoutes() {
    ///初始化无参数的纯页面跳转链接
    routerItemList.forEach((RouterItem item) {
      if (item.widget is ParamStatefulWidget) {
        LogUtil.get().i("开始添加简单参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath + ":params",
            handler: ParamHandler(item.widget).getHandler());
      } else if (item.widget is ObjectStatefulWidget) {
        LogUtil.get().i("开始添加对象参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath + ":params",
            handler: ObjectHandler(item.widget).getHandler());
      } else if (item.widget is ObjectStatelessWidget) {
        LogUtil.get().i("开始添加对象参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath + ":params",
            handler: ObjectLessHandler(item.widget).getHandler());
      } else {
        LogUtil.get().i("开始添加无参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath,
            handler: NoParamHandler(item.widget).getHandler());
      }
    });
  }
}

//无参数通用Handler
class NoParamHandler {
  Widget widget;

  NoParamHandler(this.widget);

  Handler getHandler() {
    return new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return CommonParentWidget(widget);
    });
  }
}

//单个入参数通用Handler
class ParamHandler {
  ParamStatefulWidget widget;

  ParamHandler(this.widget);

  Handler getHandler() {
    return new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          String param = params["params"]?.first;
          LogUtil.get().i('通过接口传入参数,参数$param');
          widget.param = param;
          return CommonParentWidget(widget);
        });
  }
}

//对象参数通用
class ObjectHandler {
  ObjectStatefulWidget widget;

  ObjectHandler(this.widget);

  Handler getHandler() {
    return new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String param = params["params"]?.first;
      String encodeParam = Uri.decodeComponent(param);
      widget.param = json.decode(encodeParam);
      String provideType = widget.param['ProviderModel'];
      if (provideType != null && provideType.length > 0) {
        String notifierType = widget.param['NotifierType'];
        if (notifierType != null && notifierType.length > 0) {
          return ProviderConfig.getInstance().getNotifierProvider(
              provideType, CommonParentWidget(widget),
              notifierType: notifierType);
        } else {
          return ProviderConfig.getInstance()
              .getNotifierProvider(provideType, CommonParentWidget(widget));
        }
      } else {
        return CommonParentWidget(widget);
      }
    });
  }
}


class ObjectLessHandler {
  ObjectStatelessWidget widget;

  ObjectLessHandler(this.widget);

  Handler getHandler() {
    return new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String param = params["params"]?.first;
      String encodeParam = Uri.decodeComponent(param);
      widget.param = json.decode(encodeParam);
      String provideType = widget.param['ProviderModel'];

      if (provideType != null && provideType.length > 0) {
        return ProviderConfig.getInstance()
            .getNotifierProvider(provideType, CommonParentLessWidget(widget));
      } else {
        return CommonParentLessWidget(widget);
      }
    });
  }
}

///单个参数有状态父类
// ignore: must_be_immutable
abstract class ParamStatefulWidget extends StatefulWidget {
  String param;
}

///单个对象有状态父类
// ignore: must_be_immutable
abstract class ObjectStatefulWidget extends StatefulWidget {
  Map<String, dynamic> param;
}

///单个参数无状态父类
// ignore: must_be_immutable
abstract class ParamStatelessWidget extends StatelessWidget {
  String param;
}

///单个对象 无状态父类
// ignore: must_be_immutable
abstract class ObjectStatelessWidget extends StatelessWidget {
  Map<String, dynamic> param;
}