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
  List<WorkItemModel> workItemLists = <WorkItemModel>[];

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

  PreferredSize _workPageAppBar() {
    var tabHeight =
        MediaQueryData.fromWindow(window).padding.top + kToolbarHeight;
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
                    margin: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(window).padding.top),
                    child: Text(
                      '演示',
                      style: TextStyle(fontSize: 16, color: Colors.cyanAccent),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _workPageBody(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _getWorkItem(context),
      ),
    );
  }

  List<Widget> _getWorkItem(BuildContext context) {
    var workItemWidgetLists = List<Widget>();
    if (null != workItemLists) {
      workItemLists.forEach((element) {
        workItemWidgetLists
            .add(WorkItemWidget(context, element.pageName, element.pageTitle));
      });
    }
    return workItemWidgetLists;
  }

  // ignore: always_declare_return_types
  _getData() {
    var workItem1 = WorkItemModel(pageName: BLUR_PAGE, pageTitle: '01 高斯模糊');
    var workItem2 =
        WorkItemModel(pageName: TEXT_ROW_SPACE, pageTitle: '02 行间距调整');
    var workItem3 = WorkItemModel(pageName: BOOK_PAGE, pageTitle: '03 书排列展示');
    var workItem4 = WorkItemModel(pageName: BOTTOM_PAGE, pageTitle: '04 按钮页面');
    var workItem5 =
        WorkItemModel(pageName: HTML_PAGE, pageTitle: '05 内接html页面');
    var workItem6 =
        WorkItemModel(pageName: HTML_OUT_PAGE, pageTitle: '06 外接html页面');
    var workItem7 = WorkItemModel(pageName: SHAPE_PAGE, pageTitle: "07 形状页面");
    var workItem8 = WorkItemModel(pageName: CHOICE_PAGE, pageTitle: "08 选择页面");
    var workItem9 = WorkItemModel(pageName: ALERT_PAGE, pageTitle: "09 弹窗页面");
    var workItem10 =
        WorkItemModel(pageName: WATCH_PAGE, pageTitle: "10 条目浏览页面");
    var workItem11 =
        WorkItemModel(pageName: WATCH_BY_PAGE_PAGE, pageTitle: "11 条目分页浏览页面");
    var workItem12 =
        WorkItemModel(pageName: WATCH_BY_CARD_PAGE, pageTitle: "12 条目卡片浏览页面");
    var workItem13 = WorkItemModel(pageName: STEP_PAGE, pageTitle: "13 步骤页面");
    var workItem14 =
        WorkItemModel(pageName: INHERIT_PAGE, pageTitle: "14 inherit页面");
    var workItem15 =
        WorkItemModel(pageName: STREAM_PAGE, pageTitle: "15 stream页面");
    var workItem16 =
        WorkItemModel(pageName: RXDART_PAGE, pageTitle: "16 rxDart页面");
    var workItem17 = WorkItemModel(pageName: BLOC_PAGE, pageTitle: "17 bloc页面");
    var workItem18 =
        WorkItemModel(pageName: BUILDER_PAGE, pageTitle: "18 builder页面");
    var workItem19 =
        WorkItemModel(pageName: ANIMATION_PAGE, pageTitle: "19 动画页面");
    var workItem20 =
        WorkItemModel(pageName: LOCALSAVE_PAGE, pageTitle: "20 本地存储页面");
    var workItem21 =
        WorkItemModel(pageName: CHANNEL_PAGE, pageTitle: "21 通道页面");
    var workItem22 =
        WorkItemModel(pageName: MORE_TEXT_PAGE, pageTitle: "22 多文本页面");
    var workItem23 =
        WorkItemModel(pageName: SCREEN_ADAPT, pageTitle: "23 屏幕适配页面");
    var workItem24 =
        WorkItemModel(pageName: CAMERA_PAGE, pageTitle: "24 相机和相册选取页面");
    var workItem25 =
        WorkItemModel(pageName: LATERAL_SPREADS_PAGE, pageTitle: "25 侧滑页面");
    var workItem26 =
        WorkItemModel(pageName: DISMISSIBLE_PAGE, pageTitle: "26 侧滑删除页面");
    var workItem27 = WorkItemModel(
        pageName: OTHER_LISTVIEW_FUNCTION, pageTitle: "27 ListView的其他功能页面");
    var workItem28 =
        WorkItemModel(pageName: EVENT_PAGE, pageTitle: "28 event页面");
    var workItem29 =
        WorkItemModel(pageName: NAVIGATOR_TWO, pageTitle: "29 Navigator2.0页面");
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
    workItemLists.add(workItem22);
    workItemLists.add(workItem23);
    workItemLists.add(workItem24);
    workItemLists.add(workItem25);
    workItemLists.add(workItem26);
    workItemLists.add(workItem27);
    workItemLists.add(workItem28);
    workItemLists.add(workItem29);
  }
}
