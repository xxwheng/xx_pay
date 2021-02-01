package com.wheng.xx_pay_example


import com.wheng.xx_pay_example.wxapi.WXManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "xx_pay").setMethodCallHandler(
//                MethodChannel.MethodCallHandler { call, result ->
//                    kotlin.run {
//                        if (call.method.contentEquals("xx_wxpay")) {
//                            // 微信支付
//                            WXManager.wxPay(call, result);
//                        } else if (call.method.contentEquals("wx_registerApp")) {
//                            /// 注册微信 appID;
//                            call.argument<String>("appId")?.let {
//                                WXManager.registerAppId(context, it)
//                                result.success(true);
//                                return@run
//                            }
//                            result.success(false);
//                        } else if (call.method.contentEquals("")) {
//
//                        }
//                    }
//                }
//        )
//    }

}
