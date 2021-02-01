import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:xx_pay/xx_pay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result = "";

  @override
  void initState() {
    super.initState();
  }

  void _onPay() {
    // 支付宝订单支付字符串
    String str = "";
    // ios scheme只能是纯字符
    XxPay.aliPay(str, "xxpayexample").then((value) {
      print(value.resultStr);
      print(value.message);
      this.result = value.message;
      setState(() {});
    }).catchError((err) {
      print(err);
    });
  }

  void _onWxPay() {
    final Map<String,dynamic> payMap = {
      "partnerId": partnerId,
      "prepayId": prepayId,
      "package": package,
      "nonceStr": nonceStr,
      "timeStamp": timeStamp,
      "sign": sign,
    };
    XxPay.wxPay(payMap);
  }

  void _registerAppId() {
    var appId = "appId";
    XxPay.wxRegisterApp(appId, "");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("支付结果: $result"),
              GestureDetector(
                onTap: _onWxPay,
                child: Container(
                    width: 200,
                    height: 40,
                    color: Colors.red,
                    child: Center(child: Text("点击微信支付"))
                ),
              ),
              GestureDetector(
                onTap: _registerAppId,
                child: Container(
                    width: 200,
                    height: 40,
                    color: Colors.red,
                    child: Center(child: Text("点击注册微信APPID"))
                ),
              ),
              GestureDetector(
                onTap: _onPay,
                child: Container(
                    width: 200,
                    height: 40,
                    color: Colors.red,
                    child: Center(child: Text("点击支付宝支付"))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
