
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class XxPay {
  static const MethodChannel _channel =
      const MethodChannel('xx_pay');

  static Future<String> aliPay(String orderStr, String scheme) async {
    String back = "unknown";
    if (Platform.isIOS) {
      final Map<String, dynamic> params = {
        "orderStr": orderStr,
        "scheme": scheme
      };
      var res = await _channel.invokeMethod("xx_alipay_pay", params);
      back = res.toString();
    }
    return back;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
