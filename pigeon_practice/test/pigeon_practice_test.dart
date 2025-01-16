import 'package:flutter_test/flutter_test.dart';
import 'package:pigeon_practice/pigeon_practice.dart';
import 'package:pigeon_practice/pigeon_practice_platform_interface.dart';
import 'package:pigeon_practice/pigeon_practice_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPigeonPracticePlatform
    with MockPlatformInterfaceMixin
    implements PigeonPracticePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PigeonPracticePlatform initialPlatform = PigeonPracticePlatform.instance;

  test('$MethodChannelPigeonPractice is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPigeonPractice>());
  });

  test('getPlatformVersion', () async {
    PigeonPractice pigeonPracticePlugin = PigeonPractice();
    MockPigeonPracticePlatform fakePlatform = MockPigeonPracticePlatform();
    PigeonPracticePlatform.instance = fakePlatform;

    expect(await pigeonPracticePlugin.getPlatformVersion(), '42');
  });
}
