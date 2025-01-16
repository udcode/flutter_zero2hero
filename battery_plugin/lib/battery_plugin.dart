
import 'battery_plugin_platform_interface.dart';

class BatteryPlugin {
  Future<int?> getBatteryLevel() {
    return BatteryPluginPlatform.instance.getBatteryLevel();
  }
  Stream<Map?> getBatteryLevelStream() {
    return BatteryPluginPlatform.instance.getBatteryLevelStream();
  }
}
