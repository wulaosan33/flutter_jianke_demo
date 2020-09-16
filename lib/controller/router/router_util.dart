import 'dart:async';
import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/controller/router/router_item.dart';
import 'package:untitled/pages/common/common_parent_page.dart';
import 'package:untitled/pages/home/home_page.dart';
import 'package:untitled/pages/home/theme/theme_page.dart';
import 'package:untitled/pages/work/alert_page.dart';
import 'package:untitled/pages/work/book_page.dart';
import 'package:untitled/pages/work/bottom_page.dart';
import 'package:untitled/pages/work/choice_page.dart';
import 'package:untitled/pages/work/html_out_page.dart';
import 'package:untitled/pages/work/inherit_page.dart';
import 'package:untitled/pages/work/rxdart_page.dart';
import 'package:untitled/pages/work/shape_page.dart';
import 'package:untitled/pages/work/step_page.dart';
import 'package:untitled/pages/work/stream_page.dart';
import 'package:untitled/pages/work/text_row_space_page.dart';
import 'package:untitled/pages/work/html_page.dart';
import 'package:untitled/pages/work/watch_byCard_page.dart';
import 'package:untitled/pages/work/watch_byPage_page.dart';
import 'package:untitled/pages/work/watch_page.dart';
import 'package:untitled/provider/provider_config.dart';
import 'package:untitled/utils/common_tool.dart';
import 'package:untitled/utils/log_util.dart';
import 'package:untitled/pages/work/blur_page.dart';

//系统级路由
final String MAIN = "/";
//主题页面
final String THEME_PAGE = '/themePage/';
//高斯模糊
final String BLUR_PAGE = '/blurPage/';
//行间距
final String TEXT_ROW_SPACE = "/textRowSpacePage/";
//展示页
final String BOOK_PAGE = "/bookPage/";
//按钮页
final String BOTTOM_PAGE = "/bottomPage/";
//内接html页面
final String HTML_PAGE = "/htmlPage/";
//内接html页面
final String HTML_OUT_PAGE = "/htmlOutPage/";
//形状页面
final String SHAPE_PAGE = "/shapePage/";
//选择页面
final String CHOICE_PAGE = "/choicePage/";
//弹窗页面
final String ALERT_PAGE = "/alertPage/";
//条目浏览选择
final String WATCH_PAGE = "/watchPage/";
//条目分页查看
final String WATCH_BY_PAGE_PAGE = "/watchByPagePage/";
//条目卡片查看
final String WATCH_BY_CARD_PAGE = "/watchByCardPage/";
//步骤
final String STEP_PAGE = "/stepPage/";
//inherit
final String INHERIT_PAGE = "/inheritPage/";
//stream
final String STREAM_PAGE = "/streamPage/";
//rxDart
final String RXDART_PAGE = "/rxDartPage/";

class RouterUtil {
  static Router router = new Router();
  static List<RouterItem> routerItemList = [
    RouterItem(MAIN, MyHomePage(), routerTitle: "系统级主页面"),
    RouterItem(THEME_PAGE, ThemePage(), routerTitle: "主题换肤页面"),
    RouterItem(BLUR_PAGE, BlurPage(), routerTitle: "高斯模糊页面"),
    RouterItem(TEXT_ROW_SPACE, TextRowSpacePage(), routerTitle: "行间距页面"),
    RouterItem(BOOK_PAGE, BookPage(), routerTitle: "书排列页面"),
    RouterItem(BOTTOM_PAGE, BottomPage(), routerTitle: "按钮页面"),
    RouterItem(HTML_PAGE, HtmlPage(), routerTitle: "内接html页面"),
    RouterItem(HTML_OUT_PAGE, HtmlOutPage(), routerTitle: "外接html页面"),
    RouterItem(SHAPE_PAGE, ShapePage(), routerTitle:"形状页面"),
    RouterItem(CHOICE_PAGE, ChoicePage(), routerTitle:"选择页面"),
    RouterItem(ALERT_PAGE, AlertPage(), routerTitle:"弹窗页面"),
    RouterItem(WATCH_PAGE, WatchPage(), routerTitle:"条目浏览页面"),
    RouterItem(WATCH_BY_PAGE_PAGE, WatchByPagePage(), routerTitle:"条目分页浏览页面"),
    RouterItem(WATCH_BY_CARD_PAGE, WatchByCardPage(), routerTitle:"条目卡片浏览页面"),
    RouterItem(STEP_PAGE, StepPage(), routerTitle:"条目卡片浏览页面"),
    RouterItem(INHERIT_PAGE, InheritPage(), routerTitle:"inherit页面"),
    RouterItem(STREAM_PAGE, StreamPage(), routerTitle:"stream页面"),
    RouterItem(RXDART_PAGE, RxDartPage(), routerTitle:"rxDart页面"),
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
        //LogUtil.get().i("开始添加简单参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath + ":params",
            handler: ParamHandler(item.widget).getHandler());
      } else if (item.widget is ObjectStatefulWidget) {
        //LogUtil.get().i("开始添加对象参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath + ":params",
            handler: ObjectHandler(item.widget).getHandler());
      } else if (item.widget is ObjectStatelessWidget) {
        //LogUtil.get().i("开始添加对象参数路由信息${item.routerTitle} + ${item.routerPath}");
        router.define(item.routerPath + ":params",
            handler: ObjectLessHandler(item.widget).getHandler());
      } else {
        //LogUtil.get().i("开始添加无参数路由信息${item.routerTitle} + ${item.routerPath}");
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
