import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pigeon_practice_platform_interface.dart';

/// An implementation of [PigeonPracticePlatform] that uses method channels.
class MethodChannelPigeonPractice extends PigeonPracticePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pigeon_practice');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
