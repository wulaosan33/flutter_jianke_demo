import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/home/search_page.dart';
import 'package:untitled/pages/home/user_page.dart';
import 'package:untitled/pages/home/work_page.dart';
import 'package:untitled/widgets/custom_tabbar_item.dart';

/// 首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  final List<Widget> _pages = [UserPage(), SearchPage(), WorkPage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: _pages.length,
      vsync: this,
    );
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
      bottomNavigationBar: Material(
        color: Colors.green,
        child: TabBar(
          controller: _tabController,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 100), curve: Curves.easeIn);
          },
          tabs: getTabs(),
          indicator: const BoxDecoration(),
        ),
      ),
    );
  }

  List<Widget> getTabs() {
    var widgets = <Widget>[
      CustomTabBarItem("用户", Icons.rowing),
      CustomTabBarItem("发现", Icons.search),
      CustomTabBarItem("工作", Icons.monetization_on)
    ];
    return widgets;
  }
}
