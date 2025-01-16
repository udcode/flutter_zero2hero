import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'battery_plugin_method_channel.dart';

abstract class BatteryPluginPlatform extends PlatformInterface {
  /// Constructs a BatteryPluginPlatform.
  BatteryPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryPluginPlatform _instance = MethodChannelBatteryPlugin();

  /// The default instance of [BatteryPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBatteryPlugin].
  static BatteryPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BatteryPluginPlatform] when
  /// they register themselves.
  static set instance(BatteryPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getBatteryLevel() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Stream<Map?> getBatteryLevelStream() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
