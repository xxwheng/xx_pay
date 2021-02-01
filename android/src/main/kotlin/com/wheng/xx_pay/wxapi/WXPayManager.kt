package com.wheng.xx_pay.wxapi

import android.content.Context
import com.tencent.mm.opensdk.modelpay.PayReq
import com.tencent.mm.opensdk.openapi.IWXAPI
import com.tencent.mm.opensdk.openapi.WXAPIFactory
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object WXPayManager {
    lateinit var appId: String
    lateinit var api: IWXAPI
    var result: MethodChannel.Result ? = null

    fun registerAppId(context: Context, appId: String): Boolean {
        WXPayManager.appId = appId;
        api = WXAPIFactory.createWXAPI(context, appId, true)
        return api.registerApp(appId)
    }

    fun wxPay(call: MethodCall, result: MethodChannel.Result) {
        WXPayManager.result = result;
        var request = PayReq();
        request.appId = appId
        request.partnerId = call.argument<String>("partnerId")
        request.prepayId = call.argument<String>("prepayId")
        request.packageValue = call.argument<String>("package")
        request.nonceStr = call.argument<String>("nonceStr")
        request.timeStamp = call.argument<String>("timeStamp")
        request.sign = call.argument<String>("sign")
        api.sendReq(request);
    }
}