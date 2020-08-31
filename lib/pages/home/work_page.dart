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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
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
    workItemLists.add(workItem1);
  }

}
