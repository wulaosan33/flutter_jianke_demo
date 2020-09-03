import 'package:flutter_easyrefresh/easy_refresh.dart';

class JKClassicalHeader extends ClassicalHeader {
  JKClassicalHeader()
      : super(
          refreshText: '拉动刷新',
          refreshReadyText: '释放刷新',
          refreshingText: '正在刷新...',
          refreshedText: '刷新完成',
          refreshFailedText: '刷新失败',
          noMoreText: '没有更多数据',
          infoText: '更新于 %T',
        );
}

class JKClassicalFooter extends ClassicalFooter {
  JKClassicalFooter()
      : super(
          loadText: '拉动加载',
          noMoreText: '没有更多数据',
          loadingText: '正在加载...',
          loadReadyText: '释放加载',
          loadedText: '加载完成',
          infoText: '更新于 %T',
          enableInfiniteLoad:false
        );
}
