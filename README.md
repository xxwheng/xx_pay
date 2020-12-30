# xx_pay

Alipay iOS-Swift plugin project.

## Getting Started

### 引入包后，需要在项目 ios/podfile中添加以下内容
```pre_install do |installer|
# workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
end
```


---


environment:
  sdk: ">=2.7.0 <3.0.0"
  flutter: ">=1.20.0"

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

