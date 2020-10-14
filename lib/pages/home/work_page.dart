import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controller/router/router_util.dart';
import 'package:untitled/widgets/work_item_widget.dart';
import 'package:untitled/model/work_item_model.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {

  List<WorkItemModel> workItemLists = new List<WorkItemModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _workPageAppBar(),
      body: _workPageBody(context),
    );
  }

  _workPageAppBar() {
    double tabHeight =
        MediaQueryData.fromWindow(window).padding.top + kToolbarHeight ;
    return PreferredSize(
      preferredSize: Size.fromHeight(tabHeight),
      child: Container(
        height: tabHeight,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top:MediaQueryData.fromWindow(window).padding.top),
                    child: Text("演示",style: TextStyle(fontSize: 16,color: Colors.cyanAccent),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _workPageBody(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _getWorkItem(context),
      ),
    );
  }

  _getWorkItem(BuildContext context){
    List<Widget> workItemWidgetLists = new List<Widget>();
    if(null != workItemLists) {
      workItemLists.forEach((element) {
        workItemWidgetLists.add(
            WorkItemWidget(context, element.pageName, element.pageTitle));
      });
    }
    return workItemWidgetLists;
  }

  _getData(){
    WorkItemModel workItem1 = new WorkItemModel(pageName:BLUR_PAGE,pageTitle:"01 高斯模糊");
    WorkItemModel workItem2 = new WorkItemModel(pageName:TEXT_ROW_SPACE,pageTitle:"02 行间距调整");
    WorkItemModel workItem3 = new WorkItemModel(pageName:BOOK_PAGE,pageTitle:"03 书排列展示");
    WorkItemModel workItem4 = new WorkItemModel(pageName:BOTTOM_PAGE,pageTitle:"04 按钮页面");
    WorkItemModel workItem5 = new WorkItemModel(pageName:HTML_PAGE,pageTitle:"05 内接html页面");
    WorkItemModel workItem6 = new WorkItemModel(pageName:HTML_OUT_PAGE,pageTitle:"06 外接html页面");
    WorkItemModel workItem7 = new WorkItemModel(pageName:SHAPE_PAGE,pageTitle:"07 形状页面");
    WorkItemModel workItem8 = new WorkItemModel(pageName:CHOICE_PAGE,pageTitle:"08 选择页面");
    WorkItemModel workItem9 = new WorkItemModel(pageName:ALERT_PAGE,pageTitle:"09 弹窗页面");
    WorkItemModel workItem10 = new WorkItemModel(pageName:WATCH_PAGE,pageTitle:"10 条目浏览页面");
    WorkItemModel workItem11 = new WorkItemModel(pageName:WATCH_BY_PAGE_PAGE,pageTitle:"11 条目分页浏览页面");
    WorkItemModel workItem12 = new WorkItemModel(pageName:WATCH_BY_CARD_PAGE,pageTitle:"12 条目卡片浏览页面");
    WorkItemModel workItem13 = new WorkItemModel(pageName:STEP_PAGE,pageTitle:"13 步骤页面");
    WorkItemModel workItem14 = new WorkItemModel(pageName:INHERIT_PAGE,pageTitle:"14 inherit页面");
    WorkItemModel workItem15 = new WorkItemModel(pageName:STREAM_PAGE,pageTitle:"15 stream页面");
    WorkItemModel workItem16 = new WorkItemModel(pageName:RXDART_PAGE,pageTitle:"16 rxDart页面");
    WorkItemModel workItem17 = new WorkItemModel(pageName:BLOC_PAGE,pageTitle:"17 bloc页面");
    WorkItemModel workItem18 = new WorkItemModel(pageName:BUILDER_PAGE,pageTitle:"18 builder页面");
    WorkItemModel workItem19 = new WorkItemModel(pageName:ANIMATION_PAGE,pageTitle:"19 动画页面");
    WorkItemModel workItem20 = new WorkItemModel(pageName:LOCALSAVE_PAGE,pageTitle:"20 本地存储页面");
    WorkItemModel workItem21 = new WorkItemModel(pageName:CHANNEL_PAGE,pageTitle:"21 通道页面");
    workItemLists.add(workItem1);
    workItemLists.add(workItem2);
    workItemLists.add(workItem3);
    workItemLists.add(workItem4);
    workItemLists.add(workItem5);
    workItemLists.add(workItem6);
    workItemLists.add(workItem7);
    workItemLists.add(workItem8);
    workItemLists.add(workItem9);
    workItemLists.add(workItem10);
    workItemLists.add(workItem11);
    workItemLists.add(workItem12);
    workItemLists.add(workItem13);
    workItemLists.add(workItem14);
    workItemLists.add(workItem15);
    workItemLists.add(workItem16);
    workItemLists.add(workItem17);
    workItemLists.add(workItem18);
    workItemLists.add(workItem19);
    workItemLists.add(workItem20);
    workItemLists.add(workItem21);
  }

}
