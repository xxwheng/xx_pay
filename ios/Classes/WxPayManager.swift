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

    var appid = "wx4ac4c47ec2e975db"

    var result: FlutterResult?

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (WXApi.isWXAppInstalled()) {
            self.result = result;
            let dic = JSON.init(call.arguments as Any)

            let request = PayReq.init();
            request.partnerId = dic["partnerId"].stringValue;
            request.prepayId = dic["prepayId"].stringValue;
            request.package = dic["package"].stringValue;
            request.nonceStr = dic["nonceStr"].stringValue;
            // UInt32 10位
            request.timeStamp = dic["timeStamp"].uInt32Value;
            request.sign = dic["sign"].stringValue;
            WXApi.send(request, completion: nil);
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
            WXSuccess
//            WXSuccess
//            WXErrCodeCommon
//            WXErrCodeUserCancel
//            WXErrCodeSentFail
//            WXErrCodeAuthDeny
//            WXErrCodeUnsupport
        }
    }

}
