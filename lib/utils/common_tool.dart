import 'package:rxdart/rxdart.dart';

class CommonTools {
  final refreshSubject = new PublishSubject<bool>();
  final refreshWithDataSubject = new PublishSubject<DataModel>();

  factory CommonTools() => _getInstance();
  static CommonTools get instance => _getInstance();
  static CommonTools _instance;
  static CommonTools _getInstance() {
    if (_instance == null) {
      _instance = new CommonTools._internal();
    }
    return _instance;
  }

  //Router Map;
  Map<String, String> routerMap;
  void insertRouter(String key, String newValue) {
    if (routerMap == null) {
      routerMap = new Map();
    }
    routerMap.update(key, (value) => newValue, ifAbsent: () => newValue);
  }

  String getRouterUrl(String key) {
    if (routerMap != null && routerMap.containsKey(key)) {
      String path = routerMap[key];
      return path;
    }
    return key;
  }

  CommonTools._internal() {
    print('初始化 CommonTools');
  }

  void dispose() {
    refreshSubject.close();
    refreshWithDataSubject.close();
  }

  String uploadImageFilePath;
}

enum DataModelType {
  uploadImage,
}

class DataModel {
  DataModelType dataType;
  String dataValue;
  Map dataMap;
  DataModel({this.dataType, this.dataValue, this.dataMap});
}
