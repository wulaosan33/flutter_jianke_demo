import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyChain {
  static const MethodChannel channel = const MethodChannel('channel_page');

  static Future<dynamic> get({@required String key}) {
    return channel.invokeMethod<dynamic>(
      'key_chain_get',
      <String, dynamic>{
        'key': key,
      },
    );
  }

  static Future<bool> set({@required String key, @required dynamic value}) {
    return channel.invokeMethod<bool>(
      'key_chain_set',
      <String, dynamic>{
        'key': key,
        'value': value,
      },
    );
  }

  static Future<dynamic> remove({@required String key}) {
    return channel.invokeMethod<dynamic>(
      'key_chain_remove',
      <String, dynamic>{
        'key': key,
      },
    );
  }
}
