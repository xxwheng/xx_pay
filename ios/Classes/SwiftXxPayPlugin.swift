import Flutter
import UIKit


public class SwiftXxPayPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "xx_pay", binaryMessenger: registrar.messenger())
        let instance = SwiftXxPayPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance);
    }


    /// 处理flutter传来的方法
    /// - Parameters:
    ///   - call: 来自flutter的请求
    ///   - result: 回调
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "xx_alipay_pay") {
            AlipayManager.instance.handle(call, result: result);
        } else if (call.method == "xx_wxpay") {
            WxPayManager.instance.handle(call, result: result);
        } else if (call.method == "wx_registerApp") {
            WxPayManager.instance.handleRegisterApp(call, result: result);
        }
    }


    /// ------------ *********  app周期代理函数  ********* ------------

    public func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return AppManager.instance.handleOpenURL(url: url);
    }

    public func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return AppManager.instance.handleOpenURL(url: url);
    }

    //    NOTE: 9.0以后使用新API接口
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String, annotation: Any) -> Bool {
        return AppManager.instance.handleOpenURL(url: url);
    }


}
