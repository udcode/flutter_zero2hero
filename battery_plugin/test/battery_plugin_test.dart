import 'package:flutter_test/flutter_test.dart';
import 'package:battery_plugin/battery_plugin.dart';
import 'package:battery_plugin/battery_plugin_platform_interface.dart';
import 'package:battery_plugin/battery_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBatteryPluginPlatform
    with MockPlatformInterfaceMixin
    implements BatteryPluginPlatform {

  @override
  Future<String?> getBatteryLevel() => Future.value('42');
}

void main() {
  final BatteryPluginPlatform initialPlatform = BatteryPluginPlatform.instance;

  test('$MethodChannelBatteryPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBatteryPlugin>());
  });

  test('getPlatformVersion', () async {
    BatteryPlugin batteryPlugin = BatteryPlugin();
    MockBatteryPluginPlatform fakePlatform = MockBatteryPluginPlatform();
    BatteryPluginPlatform.instance = fakePlatform;

    expect(await batteryPlugin.getPlatformVersion(), '42');
  });
}
