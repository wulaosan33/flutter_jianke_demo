import 'package:flutter/material.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext context;

  ///GlobalModel可以用来统一管理所有的model
  ///

  GlobalModel();

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("GlobalModel销毁了");
  }

  void refresh() {
    notifyListeners();
  }
}
