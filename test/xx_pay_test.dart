import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xx_pay/xx_pay.dart';

void main() {
  const MethodChannel channel = MethodChannel('xx_pay');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XxPay.platformVersion, '42');
  });
}
