import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:untitled/utils/easy_refresh_util.dart';
import 'package:untitled/widgets/converse_list_header.dart';

/// 动态发现页
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollController = new ScrollController();
  EasyRefreshController _refreshController = new EasyRefreshController();

  List<int> dataList = <int>[];

  /// 分页
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      var offset = _scrollController.position.pixels;
      print('滑动距离$offset');

      // 如果滑动到底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // do something
      }
    });

    return Scaffold(
      appBar: _searchPageAppBar(),
      backgroundColor: Colors.orange,
      body: _listView(),
    );
  }

  PreferredSize _searchPageAppBar() {
    var tabHeight =
        MediaQueryData.fromWindow(window).padding.top + kToolbarHeight;
    return PreferredSize(
      preferredSize: Size.fromHeight(tabHeight),
      child: Container(
        height: tabHeight,
        color: Colors.green,
        child: Column(
          children: <Widget>[
            /*Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(

                  ),
                ),
              ],
            ),*/
            //TextField()
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return Container(
      color: Colors.white,
      child: EasyRefresh(
        controller: _refreshController,

        /// 第三方刷新事件
        onRefresh: () async {
          dataList.clear();
          pageIndex = 1;
          _loadData();
        },
        onLoad: () => _handleLoad(),

        ///项目国际化异常
        header: JKClassicalHeader(),
        footer: JKClassicalFooter(),
        child: Column(
          children: <Widget>[
            ConverseListHeader(
              onPressed: () {},
            ),
            Container(
              child: ListView.separated(
                controller: _scrollController,

                /// 内容适配,无限尺寸,NeverScrollableScrollPhysics禁止滚动时候,需要自适应,不然不显示
                shrinkWrap: true,

                ///滑动类型设置 NeverScrollableScrollPhysics 禁止滑动
//              physics: FixedExtentScrollPhysics(),
                //确定每一个item的高度 会让item加载更加高效
//            itemExtent: 200.0,
                //cacheExtent  设置预加载的区域
//            cacheExtent: 30.0,
                /// 分割线属性
                padding: EdgeInsets.all(0),
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                    height: 1,
                  );
                },
                /**listView 个数*/
                itemCount: dataList.length,
                /**listView item*/
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    //单击事件响应
                    onTap: () {
                      print('点击了 $index');
                    },
                    child: Container(
                      color: Colors.cyanAccent,
                      alignment: Alignment.centerLeft,
                      height: 88,
                      child: Text('内容 - $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        emptyWidget: dataList.length > 0
            ? null
            : const Center(
                child: Text('暂无数据'),
              ),
      ),
    );
  }

  _loadData() {
    List<int> tempList = [];

    if (pageIndex == 1) {
      for (int i = 0; i < 2; i++) {
        tempList.add(i);
      }
    } else if (pageIndex >= 4) {
    } else {
      for (int i = dataList.last; i < (dataList.last + 2); i++) {
        tempList.add(i);
      }
    }

    setState(() {
      dataList.addAll(tempList);
      /*  _refreshController.finishLoad(
          success: true, noMore: (tempList.length == 0));*/
    });
  }

  //加载完成后延迟1s关闭加载完成窗.避免后续操作手势误触.与.finished不兼容
  void loadingBottomControl() {
    Future.delayed(Duration(milliseconds: 1000), () {});
  }

  _handleLoad() async {
    pageIndex++;
    _loadData();
    loadingBottomControl();
  }
}
