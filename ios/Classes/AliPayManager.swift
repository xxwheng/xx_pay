//
//  AliPayManager.swift
//  xx_pay
//
//  Created by 恒  王 on 2020/12/30.
//
/// 支付宝客户端返回码
/// https://opendocs.alipay.com/open/59/103671
///

import Foundation
import SwiftyJSON

class AlipayManager: NSObject {

    static let instance = AlipayManager();

    var result: FlutterResult?

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result;
        let dic = JSON.init(call.arguments as Any)
        let orderStr = dic["orderStr"].stringValue;
        let scheme = dic["scheme"].stringValue;
        if (orderStr.isEmpty || scheme.isEmpty) {
            self.result?(nil);
            return;
        }
        pay(orderStr: orderStr, scheme: scheme);
    }

    /// 支付宝支付
    /// - Parameters:
    ///   - orderStr: 支付订单信息
    ///   - scheme: scheme
    public func pay(orderStr: String, scheme: String) {
        print("开始支付: \(orderStr) \n \(scheme)")
        AlipaySDK.defaultService()?.payOrder(orderStr, fromScheme: scheme, callback: { (res) in
            print(res);
            AlipayManager.instance.handlePayRes(res: res);
        });
    }

    /// 处理支付宝支付回调参数
    /// - Parameter res: 支付回调参数
    public func handlePayRes(res: [AnyHashable: Any]?) {
        print(res);
        if let dic = res as? [String: Any] {
            let json = JSON.init(dic)
            let code = json["resultStatus"].intValue
            let result = json["result"].stringValue
            self.result?(["code":code, "result": result]);
        } else {
            self.result?(nil);
        }
    }

    public func handleOpenURL(url: URL) {
        print(url);
        AlipaySDK.defaultService()?.processOrder(withPaymentResult: url, standbyCallback: { (res) in
            print(res);
            AlipayManager.instance.handlePayRes(res: res);
        })
    }

}
