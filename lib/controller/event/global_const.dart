import 'package:event_bus/event_bus.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/generated/l10n.dart';

S localText(context) {
  return S.of(context);
}

S get localString {
  return S.of(navigatorStateKey.currentContext);
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}

GlobalKey<NavigatorState> navigatorStateKey = GlobalKey();

EventBus EVENT_BUS = EventBus();

final testStr = 'jim';
const testStr2 = 'jim';
String testStr3 = 'jim';

String doStr() {
  return 'test';
}

final String testStr22 = doStr();

//const String testStr23 = doStr();

//final wordPair2 = Window;
const time1 = '1111';
//final time = getTime();
final time2 = DateTime.now();

DateTime time3 = DateTime.now();

