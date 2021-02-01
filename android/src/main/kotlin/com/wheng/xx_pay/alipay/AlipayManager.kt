package com.wheng.xx_pay.alipay

import android.app.Activity
import android.content.Context
import android.os.Handler
import android.os.Message
import android.text.TextUtils
import com.alipay.sdk.app.PayTask
import io.flutter.plugin.common.MethodChannel

object AlipayManager {
    private  val SDK_PAY_FLAG = 1;

    var result: MethodChannel.Result? = null

    fun toPay(orderInfo: String, activity: Activity) {
        val payRunnable = Runnable {
            kotlin.run {
                var alipay = PayTask(activity);
                var result = alipay.payV2(orderInfo, true);

                var msg = Message();
                msg.what = SDK_PAY_FLAG;
                msg.obj = result;
                mHandler.sendMessage(msg)
            }
        }
        var thread = Thread(payRunnable);
        thread.start()
    }


    private val mHandler = object : Handler() {
        override fun handleMessage(msg: Message) {
            when (msg.what) {
                SDK_PAY_FLAG -> {
                    val payResult = PayResult(msg.obj as Map<String, String>)
                    result?.success(mapOf("code" to payResult.resultStatus, "result" to payResult.result))
                }
            }
        }
    }
}