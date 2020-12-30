#import "XxPayPlugin.h"
#import <AlipaySDK/AlipaySDK.h>

#if __has_include(<xx_pay/xx_pay-Swift.h>)
#import <xx_pay/xx_pay-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xx_pay-Swift.h"
#endif


@implementation XxPayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
  [SwiftXxPayPlugin registerWithRegistrar:registrar];
}
@end
