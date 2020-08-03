import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/utils/common_tool.dart';

/// BaseProvide
class BaseProvider with ChangeNotifier {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    compositeSubscription.dispose();
  }
}

/// page的基类 [PageProvider]
///
/// 隐藏了 [PageProvider] 的调用
abstract class PageProvider extends StatelessWidget {
  /// The values made available to the [child].

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseProvider>(
      create: (context) => BaseProvider(),
      child: buildContent(context),
    );
  }
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final _baseStateSubscriptions = CompositeSubscription();

  @override
  void initState() {
    super.initState();
    var ref = CommonTools.instance.refreshSubject.listen((refresh) {
      if (refresh) {
        refreshPageState();
      }
    });
    _baseStateSubscriptions.add(ref);

    var refWithData =
        CommonTools.instance.refreshWithDataSubject.listen((refreshData) {
      if (refreshData != null) {
        refreshPageState();
      }
    });
    _baseStateSubscriptions.add(refWithData);
  }

  void refreshPageState();

  Widget getAppBarView(String title) {
    return Container(
      color: Color(0xFF0070E4),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQueryData.fromWindow(window).padding.top,
          ),
          Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _baseStateSubscriptions.dispose();
  }
}
