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
    String str = "app_id=2018053160301392&format=JSON&charset=utf-8&sign_type=RSA2&version=1.0&return_url=https%3A%2F%2Fm.t.jjys168.com%2Fhtml%2Fmyorderlist.html&notify_url=https%3A%2F%2Fm.t.jjys168.com%2Fa%2FAlipay_notify.html&timestamp=2021-02-01+10%3A39%3A58&biz_content=%7B%22out_trade_no%22%3A%22e_1_mysql_3196%22%2C%22subject%22%3A%22%5Cu77ed%5Cu671f%5Cu6708%5Cu5b50%5Cu670d%5Cu52a1%281%5Cu5929%29%22%2C%22total_amount%22%3A%220.01%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%7D&method=alipay.trade.app.pay&sign=aC3iVEcrNsNPViqI9pMJ1iDXL%2BFftQMUhl6rO5d8Q20WAnVY%2Fgc5MHXhOIm7hJ%2FKRelH%2F5QSCbpDTcKdXABdNOfuO3px5QlFH5nONOhyNF2qkOBL5on1wUfc4v1rTB1iELemOjGGVgu%2F58gzusVcFoqwrxHhnLrHd1JJ09M7WEt2FVYThuUHwhoNmJh%2FWYXsFBvEZtIC7fgEHFqdw9VJ%2BBCS3Lj59d6dl7e1SDkJFndFx5X527BxHKJxoehEnWmBH%2Bh3aA8PclpwEIZThwvAXSyuhDtz6wtDY5ztxhKxIteaqX7WTK7sStVdSr7KTeDa9K7%2BTlhStuVZ8s2DXJ0iUg%3D%3D";
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
    XxPay.wxPay("1507026001", "wx281433297927528637712c844c164a0000", "Sign=WXPay", "tDwvBZlf0Sr520h7", 1611815609, "B00D5A7BCFE499D10E62B2D9759B1B5D");
  }

  void _registerAppId() {
    var appId = "wx4ac4c47ec2e975db";
    XxPay.wxRegisterApp(appId, "");
  }

  void _testTap() {
    XxPay.wxTest();
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
              GestureDetector(
                onTap: _testTap,
                child: Container(
                    width: 200,
                    height: 40,
                    color: Colors.red,
                    child: Center(child: Text("点击测试"))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
