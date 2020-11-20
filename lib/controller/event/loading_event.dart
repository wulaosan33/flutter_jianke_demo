import 'package:untitled/controller/event/event_declaration.dart';
import 'package:untitled/utils/log_util.dart';

///显示全局遮罩
// ignore: always_declare_return_types
showLoading(String msg) {
  ///没有图标展示的时候才出发事件
  if (!LoadingShowFlag().showFlag) {
    LogUtil.get().i('开始尝试展示加载图标: ');
    LoadingShowFlag().showFlag = true;
    LoadingEvent chgEvent = LoadingEvent(true, msg: msg);
    eventBus.fire(chgEvent);
  }
}

///关闭全局遮罩
// ignore: always_declare_return_types
closeLoading() {
  if (LoadingShowFlag().showFlag) {
    LogUtil.get().i('开始尝试关闭加载图标: ');
    LoadingShowFlag().showFlag = false;
    eventBus.fire(LoadingEvent(false));
  }
}

///显示遮罩事件
class LoadingEvent {
  bool showFlag;
  String msg;

  LoadingEvent(this.showFlag, {this.msg});
}

class LoadingShowFlag {
  // 单例公开访问点
  factory LoadingShowFlag() => _sharedInstance();

  bool showFlag = false;

  // 静态私有成员，没有初始化
  static LoadingShowFlag _instance;

  // 私有构造函数
  LoadingShowFlag._() {
    showFlag = false;
    // 具体初始化代码
  }

  // 静态、同步、私有访问点
  static LoadingShowFlag _sharedInstance() {
    _instance ??= LoadingShowFlag._();
    return _instance;
  }
}
