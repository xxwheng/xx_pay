package com.wheng.xx_pay_example.wxapi
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.tencent.mm.opensdk.constants.ConstantsAPI
import com.tencent.mm.opensdk.modelbase.BaseReq
import com.tencent.mm.opensdk.modelbase.BaseResp
import com.tencent.mm.opensdk.modelpay.PayReq
import com.tencent.mm.opensdk.openapi.*;
import com.wheng.xx_pay_example.R
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.lang.reflect.Method

class WXPayEntryActivity: Activity(), IWXAPIEventHandler {

    lateinit var api: IWXAPI
    val TAG: String = "WXPayEntryActivity"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.pay_result)
        api = WXAPIFactory.createWXAPI(this, WXManager.appId, false)
        api.handleIntent(intent, this);
    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        setIntent(intent)
        api.handleIntent(intent, this)
    }

    override fun onResp(resp: BaseResp?) {
        TODO("Not yet implemented")
        if (resp?.type == ConstantsAPI.COMMAND_PAY_BY_WX) {
            if (WXManager.result != null) {
                var dic = HashMap<String, Any>();
                dic["code"] = resp.errCode
                dic["result"] = resp.errStr
                WXManager.result?.success(dic)
            }
        }
    }

    override fun onReq(req: BaseReq?) {
        TODO("Not yet implemented")

    }

}

/// 微信管理
object WXManager {
    lateinit var appId: String
    lateinit var api: IWXAPI
    var result: MethodChannel.Result ? = null

    init {

    }
    fun registerAppId(context: Context, appId: String) {
        this.appId = appId;
        api = WXAPIFactory.createWXAPI(context, appId, true)
        api.registerApp(appId)
    }
    fun wxPay(call: MethodCall, result: MethodChannel.Result) {
        this.result = result;
        var request = PayReq();
        request.appId = this.appId
        request.partnerId = call.argument<String>("partnerId")
        request.prepayId = call.argument<String>("prepayId")
        request.packageValue = call.argument<String>("package")
        request.nonceStr = call.argument<String>("nonceStr")
        request.timeStamp = call.argument<String>("timeStamp")
        request.sign = call.argument<String>("sign")

        api.sendReq(request);
    }
}