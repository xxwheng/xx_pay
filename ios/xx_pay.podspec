#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint xx_pay.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'xx_pay'
  s.version          = '0.0.1'
  s.summary          = 'Alipay plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'wanghengbai@126.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  # 若UTDID冲突， 可手动引入无UTDID版本
  # https://opendocs.alipay.com/open/54/104509
  s.dependency 'AlipaySDK-iOS'
  s.dependency 'SwiftyJSON'
  s.platform = :ios, '9.0'



  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
