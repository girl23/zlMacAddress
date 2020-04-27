import 'dart:async';

import 'package:flutter/services.dart';

class Zlmacaddress {
  static const MethodChannel _channel =
      const MethodChannel('zlmacaddress');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
