enum WXErrCode
  /* 成功0 */
  success,
  /* -1普通错误类型 签名错误、未注册APPID、项目设置APPID不正确、注册的APPID与设置的不匹配、其他异常等 */
  common,
  /* -2用户点击取消并返回 */
  cancel,
  /* -3发送失败 */
  sendFail,
  /* -4授权失败 */
  authDeny,
  /* -5微信不支持 */
  unSupport,
  /* -6微信未安装 */
  unInstall,
  /* -7其它错误 */
  other,
}

class WXPayResultBean {
  WXErrCode _code;
  String _resultStr;
  String _message;

  WXErrCode get code => _code;

  String get message => _message;

  String get resultStr => _resultStr;


  WXPayResultBean({ WXErrCode code, String message, String resultStr }) {
    _code = code;
    _message = message;
    _resultStr = resultStr;
  }

  WXPayResultBean.fromJson(dynamic res) {
    _resultStr = res["result"].toString();
    String code = res["code"].toString();
    switch (code) {
      case "0":
        _code = "支付成功";
        break;
      case "-1":
        _code = "普通错误类型";
        break;
      case "-2":
        _code = "用户取消支付";
        break;
      case "-3":
        _code = "发送失败";
        break;
      case "-4":
        _code = "授权失败";
        break;
      case "-5":
        _code = "微信不支持";
        break;
      case "-6":
        _code = "该设备未安装微信";
        break;
      default:
        _code = "其它错误";
        break;
    }

  }
}