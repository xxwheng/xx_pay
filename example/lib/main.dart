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
    XxPay.aliPay("orderStr", "scheme").then((value) {
      this.result = value.message;
      setState(() {});
    });
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
                onTap: _onPay,
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
