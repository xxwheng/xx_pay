//
//  WxPayManager.swift
//  xx_pay
//
//  Created by 恒  王 on 2021/1/28.
//

import Foundation
import SwiftyJSON

/// 微信支付
// wx4ac4c47ec2e975db
class WxPayManager: NSObject, WXApiDelegate {
    
    static let instance = WxPayManager();

    var appid = ""
    var universalLink = "";

    var result: FlutterResult?

    /// channel方法
    public func handleRegisterApp(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let dic = JSON.init(call.arguments as Any)
        if let appId = dic["appId"].string,
           let link = dic["universalLink"].string {
            self.registerApp(appId: appId, universalLink: link)
            result(true);
        } else {
            result(false);
        }
    }

    /// 注册微信appid universalLink;
    public func registerApp(appId: String, universalLink: String) {
        WxPayManager.instance.appid = appId;
        WxPayManager.instance.universalLink = universalLink;
        WXApi.registerApp(appid, universalLink: universalLink);
    }

    /// channel方法
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result;
        if (appid.isEmpty) {
            result(["code": -7, "result": "请先注册appId \n wxRegisterApp"]);
            return;
        }
        if (WXApi.isWXAppInstalled()) {
            let dic = JSON.init(call.arguments as Any)
            let request = PayReq.init();
            request.partnerId = dic["partnerId"].stringValue;
            request.prepayId = dic["prepayId"].stringValue;
            request.package = dic["package"].stringValue;
            request.nonceStr = dic["nonceStr"].stringValue;
            // UInt32 10位
            request.timeStamp = dic["timeStamp"].uInt32Value;
            request.sign = dic["sign"].stringValue;
            WXApi.send(request) { (isTrue) in
                print(isTrue);
            };
        } else {
            result(["code":-6, "result": "设备未安装微信"]);
        }
    }

    func onReq(_ req: BaseReq) {

    }

    /// 回调
    func onResp(_ resp: BaseResp) {
        if let payRes = resp as? PayResp {
            self.result?(["code":payRes.errCode, "result": payRes.errStr]);
        }
    }

}
