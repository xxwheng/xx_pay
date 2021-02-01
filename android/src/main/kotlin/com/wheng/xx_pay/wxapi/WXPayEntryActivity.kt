package com.wheng.xx_pay.wxapi

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import com.tencent.mm.opensdk.constants.ConstantsAPI
import com.tencent.mm.opensdk.modelbase.BaseReq
import com.tencent.mm.opensdk.modelbase.BaseResp
import com.tencent.mm.opensdk.openapi.IWXAPI
import com.tencent.mm.opensdk.openapi.IWXAPIEventHandler
import com.tencent.mm.opensdk.openapi.WXAPIFactory

class WXPayEntryActivity: Activity(), IWXAPIEventHandler {
    lateinit var api: IWXAPI
    val TAG: String = "WXPayEntryActivity"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        api = WXAPIFactory.createWXAPI(this, WXPayManager.appId, false)
        api.handleIntent(intent, this);
    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        setIntent(intent)
        api.handleIntent(intent, this)
    }

    override fun onResp(resp: BaseResp?) {
        if (resp?.type == ConstantsAPI.COMMAND_PAY_BY_WX) {
            WXPayManager.result?.success(mapOf("code" to resp.errCode, "result" to resp.errStr))
        }
        finish()
    }

    override fun onReq(req: BaseReq?) {
    }
}