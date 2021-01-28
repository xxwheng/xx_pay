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
    String str = "app_id=2018053160301392&format=JSON&charset=utf-8&sign_type=RSA2&version=1.0&return_url=https%3A%2F%2Fm.t.jjys168.com%2Fhtml%2Fmyorderlist.html&notify_url=https%3A%2F%2Fm.t.jjys168.com%2Fa%2FAlipay_notify.html&timestamp=2021-01-26+17%3A58%3A32&biz_content=%7B%22out_trade_no%22%3A%22e_1_mysql_3169%22%2C%22subject%22%3A%22%5Cu4f4f%5Cu5bb6%5Cu6708%5Cu5b50%5Cu670d%5Cu52a1%2826%5Cu5929%29%22%2C%22total_amount%22%3A%220.01%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%7D&method=alipay.trade.app.pay&sign=Hf7w9QR3O4iz0p9kIzslNtjAo8ehJGIpnKb5a5qthE05t9zBB0RN8Y6n9ttFZJce8Biih7OCkJQGhI3gG%2FIX7N0TjklVIA7RlfqiBu2wKnZ%2F%2BwxcCz%2F1gQFlvjZd7WN5whUwRNM2ArCPn2N5NGdjgSwS%2Bn3NrKrCXaEYIrjzGNOiwkKUSVf9KJGn5A%2BklscEX8R2L0UG40X1WfwQzcMPCaH0WAeH13OcGw3KirJ0OTFqGaDummHJdKxpM7C8XxSiWCBcKbs0TjnGaCgjcO9DV%2Bkz0KfcIQjcf%2BreVZd6tEdWfPnI9ImY3HaO%2FxnZATmej72u9joO3bfojhegVJ9naw%3D%3D";

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
    XxPay.wxPay("1507026001", "wx28140120727905a6b75f69b1f8643e0000", "Sign=WXPay", "2o7h9nqT4EkRAqoG", 1611813680, "5F59EF5040742C6928C07BD00AF6D51B");
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
                    child: Center(child: Text("点击支付，两秒后返回"))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
