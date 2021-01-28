enum AliPayCode {
  /* 9000订单支付成功 */
  succeed,
  /* 8000正在处理中，支付结果未知（有可能已经支付成功），请通过 alipay.trade.query 接口查询订单支付状态 */
  handling,
  /* 4000订单支付失败 */
  failed,
  /* 6001用户中途取消 */
  cancelled,
  /* 6002网络连接出错 */
  connectError,
  /* 6004支付结果未知（有可能已经支付成功），请通过 alipay.trade.query 接口查询订单支付状态 */
  unknown,
  /* 其他其他支付错误 */
  otherError,
}

// 支付宝支付结果
class AliPayResultBean {
  AliPayCode _code;
  String _message;
  String _resultStr;

  AliPayCode get code => _code;

  String get message => _message;

  String get resultStr => _resultStr;

  AliPayResultBean({AliPayCode code, String message, String resultStr}) {
    _code = code;
    _message = message;
    _resultStr = resultStr;
  }

  AliPayResultBean.fromJson(dynamic res) {
    _resultStr = res["result"].toString();
    String code = res["code"].toString();
    switch (code) {
      case '9000':
        _code = AliPayCode.succeed;
        _message = "订单支付成功";
        break;
      case '8000':
        _code = AliPayCode.handling;
        _message = "订单正在处理中";
        break;
      case '4000':
        _code = AliPayCode.failed;
        _message = "订单支付失败";
        break;
      case '6001':
        _code = AliPayCode.cancelled;
        _message = "用户中途取消";
        break;
      case '6002':
        _code = AliPayCode.connectError;
        _message = "网络连接出错";
        break;
      case '6004':
        _code = AliPayCode.unknown;
        _message = "支付结果未知";
        break;
      default:
        _code = AliPayCode.otherError;
        _message = "订单支付异常";
        break;
    }
  }
}
