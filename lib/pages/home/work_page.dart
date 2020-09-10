import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controller/router/router_util.dart';
import 'package:untitled/pages/work/html_page.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
    workItemLists.add(workItem1);
    workItemLists.add(workItem2);
    workItemLists.add(workItem3);
    workItemLists.add(workItem4);
    workItemLists.add(workItem5);
  }

}
