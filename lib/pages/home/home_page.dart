import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/home/search_page.dart';
import 'package:untitled/pages/home/user_page.dart';
import 'package:untitled/pages/home/work_page.dart';
import 'package:untitled/tool/color_tools.dart';

/// 首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}):super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  final List<Widget> _tabItems = [
    SearchPage(),
    UserPage(),
    WorkPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: _tabItems.length,
      vsync: this,
    );

  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("剑客"),
      ),
      body: new PageView(

      ),
      bottomNavigationBar: new Material(
        color: backBlue,
        ///tabBar控件
        child: new TabBar(
          ///必须有的控制器，与pageView的控制器同步
          controller: _tabController,
          ///每一个tab item，是一个List<Widget>
          tabs: _tabItems,
          ///tab底部选中条颜色
          indicatorColor: backColorC,
        ),
      ),
    );
  }
}

