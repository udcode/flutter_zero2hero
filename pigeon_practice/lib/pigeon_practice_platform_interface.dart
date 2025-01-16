import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeon_practice_method_channel.dart';

abstract class PigeonPracticePlatform extends PlatformInterface {
  /// Constructs a PigeonPracticePlatform.
  PigeonPracticePlatform() : super(token: _token);

  static final Object _token = Object();

  static PigeonPracticePlatform _instance = MethodChannelPigeonPractice();

  /// The default instance of [PigeonPracticePlatform] to use.
  ///
  /// Defaults to [MethodChannelPigeonPractice].
  static PigeonPracticePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PigeonPracticePlatform] when
  /// they register themselves.
  static set instance(PigeonPracticePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
