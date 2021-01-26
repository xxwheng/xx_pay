//
//  AppManager.swift
//  xx_pay
//
//  Created by 恒  王 on 2020/12/30.
//

/// 所有回调全由 AppMananger 下发
/// AliPayManager
///
///

import Foundation

public class AppManager {
    static let instance = AppManager()

    public func handleOpenURL(url: URL) -> Bool {
        print(url)
        if (url.host == "safepay") {
            AlipayManager.instance.handleOpenURL(url: url);
        }
        return true;
    }
}
