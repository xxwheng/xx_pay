import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:xx_pay/alipay_result_bean.dart';
import 'package:xx_pay/wxpay_result_bean.dart';


class XxPay {
  static const MethodChannel _channel =
      const MethodChannel('xx_pay');

  /* 支付宝支付
  *  -->支付单信息
  *  -->iOS_scheme
  *  */
  static Future<AliPayResultBean> aliPay(String orderStr, String scheme) async {
    final Map<String, dynamic> params = {
      "orderStr": orderStr,
      "scheme": scheme
    };
    if (Platform.isIOS) {
      var res = await _channel.invokeMethod("xx_alipay_pay", params);
      return AliPayResultBean.fromJson(res);
    } else if (Platform.isAndroid) {
      var res = await _channel.invokeMethod("xx_alipay_pay", params);
      print(res);
    }
    return null;
  }

  /*
  * 微信注册appid universalLink
  * */
  static Future<bool> wxRegisterApp(String appId, String universalLink) async {
    final Map<String, dynamic> params = {
      "appId": appId,
      "universalLink": universalLink
    };
    if (Platform.isIOS) {
      var res = await _channel.invokeMethod("wx_registerApp", params);
      return  res as bool;
    } else if (Platform.isAndroid) {
      print("注册APPID");
      var res = await _channel.invokeMethod("wx_registerApp", params);
      print(res);
      return  false;
    }
    return false;
  }

  /*
  * 微信支付
  * */
  static Future<WXPayResultBean> wxPay(String partnerId, String prepayId, String package, String nonceStr, int timeStamp, String sign) async {
    final Map<String, dynamic> params = {
      "partnerId": partnerId,
      "prepayId": prepayId,
      "package": package,
      "nonceStr": nonceStr,
      "timeStamp": timeStamp,
      "sign": sign,
    };
    if (Platform.isIOS) {
      var res = await _channel.invokeMethod("xx_wxpay", params);
      return  WXPayResultBean.fromJson(res);
    } else if (Platform.isAndroid) {
      var res = await _channel.invokeMethod("xx_wxpay", params);
      return null;
    }
    return null;
  }

  static Future<bool> wxTest() async {
    final Map<String, dynamic> params = {
      "id": "123456789"
    };
    if (Platform.isAndroid) {
      print("点击测试");
      var res = await _channel.invokeMethod("getTest", params);
      print(res);
    }
    return true;
  }
}
