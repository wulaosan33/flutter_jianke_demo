import 'dart:async';
import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/controller/route_item/router_item.dart';
import 'package:untitled/pages/common/common_parent_page.dart';
import 'package:untitled/provider/provider_config.dart';
import 'package:untitled/utils/common_tool.dart';


//系统级路由
// ignore: non_constant_identifier_names
final String MAIN = "/";

class RouterUtil {
  static Router router = new Router();
  static List<RouterItem> routerItemList = [

  ];


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
  static popRefreshPageWithData(BuildContext context,DataModel model) {
    Navigator.pop(context);
    CommonTools.instance.refreshWithDataSubject.add(model);
  }

  ///返回指定页面  refresh 刷新
  static popToPage(BuildContext context,String routerURL,bool refresh,{bool routerParam = false}) {

    if(routerParam){
      routerURL = CommonTools.instance.getRouterUrl(routerURL);
    }
    Navigator.popUntil(context, ModalRoute.withName(routerURL));
    CommonTools.instance.refreshSubject.add(refresh);
  }

  ///返回指定页面 并带数据 刷新
  static popToPageWithData(BuildContext context,String routerURL,DataModel model,{bool routerParam = false}) {
    if(routerParam){
      routerURL = CommonTools.instance.getRouterUrl(routerURL);
    }
    Navigator.popUntil(context, ModalRoute.withName(routerURL));
    CommonTools.instance.refreshWithDataSubject.add(model);
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
          if(provideType != null && provideType.length > 0){

            String notifierType = widget.param['NotifierType'];
            if(notifierType != null && notifierType.length > 0){
              return ProviderConfig.getInstance().getNotifierProvider(provideType,  CommonParentWidget(widget),notifierType:notifierType);
            }else{
              return ProviderConfig.getInstance().getNotifierProvider(provideType,  CommonParentWidget(widget));
            }

          }else{
            return CommonParentWidget(widget);
          }

        });
  }
}

//单个入参数通用Handler
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

          if(provideType != null && provideType.length > 0){
            return ProviderConfig.getInstance().getNotifierProvider(provideType,  CommonParentLessWidget(widget));
          }else{
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

