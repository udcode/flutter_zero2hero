
export 'package:pigeon_practice/src/method_channel/messages.g.dart';

import 'pigeon_practice_platform_interface.dart';

class PigeonPractice {



  Future<String?> getPlatformVersion() {
    return PigeonPracticePlatform.instance.getPlatformVersion();
  }
}
