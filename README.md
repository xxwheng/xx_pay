# xx_pay

支付宝、微信支付  Flutter插件，支持iOS和Android

Alipay iOS-Swift plugin project.

A Flutter pluin for iOS and Android for AliPay and WXPay



### 在pubspec.yaml文件导入

```dart
dependencies:
	xx_pay:
  	git: https://github.com/xxwheng/xx_pay.git
```



## iOS配置

### 修改项目 ios/podfile文件
注释掉 use_frameworks!
```
# use_frameworks!
```



添加target--info--URL Types

​	alipay 	URLSchemes

​	weixin 	URLSchemes

修改 Info.plist： 添加：

```
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>wechat</string>
	<string>weixin</string>
	<string>weixinULAPI</string>
	<string>alipays</string>
	<string>alipay</string>
</array>
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key>
	<true/>
	<key>NSAllowsArbitraryLoadsInWebContent</key>
	<true/>
</dict>
```



## Android配置:

#### 无



### 调用支付之前先注册APPID和UniversalLink

```
/// appid Android和iOS都要用到， universalLink单iOS使用
XxPay.wxRegisterApp(appId, universalLink);

```



### 调用方式：

#### 支付支付

```
/// 支付宝调用
/// OrderInfoStr 订单支付串
/// scheme 需和URL Types中填写的一致
/// res 非iOS、Android平台，返回为空
XxPay.aliPay(OrderInfoStr, scheme).then((res) {
	// res: AliPayResultBean类型
})
```

微信支付

```
/// 微信支付调用
/// partnerId 商户号
/// prepayId	预支付交易会话ID
/// package		Sign=WXPay
/// nonceStr	随机字符串
/// timeStamp	时间戳10位
/// sign			签名
/// res 非iOS、Android平台，返回为空
XxPay.wxPay(
        "partnerId",
        "prepayId",
        "package",
        "nonceStr",
        "timeStamp",
        "sign").then((res) {
        // res: WXPayResultBean类型
})
```







### 回调类说明

```
支付宝支付返回码枚举	
AliPayCode
支付宝支付返回结果类
AliPayResultBean {
	AliPayCode code;
	String message;
	String resultStr;
}

微信支付返回码枚举	
WXErrCode
微信支付返回结果类
WXPayResultBean {
	WXErrCode code;
	String message;
	String resultStr;
}
```





---


environment:
  sdk: ">=2.7.0 <3.0.0"
  flutter: ">=1.20.0"

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

