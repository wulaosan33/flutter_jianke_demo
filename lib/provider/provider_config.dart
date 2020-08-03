import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/base_provider.dart';
import 'package:untitled/provider/global_model.dart';

class ProviderConfig {
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ProviderConfig._internal();

  ///统一管理所有的model

  ///全局provider
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }

  ///获得provider
  ChangeNotifierProvider getNotifierProvider(String providerType, Widget widget,
      {String notifierType}) {
    return baseProvider(widget);
  }

  /// 默认 page
  ChangeNotifierProvider<BaseProvider> baseProvider(
    Widget widget,
  ) {
    return ChangeNotifierProvider<BaseProvider>(
      create: (context) => BaseProvider(),
      child: widget,
    );
  }
}
