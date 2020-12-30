
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:xx_pay/alipay_result_bean.dart';



class XxPay {
  static const MethodChannel _channel =
      const MethodChannel('xx_pay');

  /* 支付宝支付
  *  -->支付单信息
  *  -->iOS_scheme
  *  */
  static Future<AliPayResultBean> aliPay(String orderStr, String scheme) async {
    if (Platform.isIOS) {
      final Map<String, dynamic> params = {
        "orderStr": orderStr,
        "scheme": scheme
      };
      var res = await _channel.invokeMethod("xx_alipay_pay", params);
      return AliPayResultBean.fromJson(res);
    }
    return null;
  }
}
