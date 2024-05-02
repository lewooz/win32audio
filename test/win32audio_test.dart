import 'package:flutter_test/flutter_test.dart';
import 'package:win32audio/win32audio.dart';
import 'package:win32audio/win32audio_platform_interface.dart';
import 'package:win32audio/win32audio_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWin32audioPlatform
    with MockPlatformInterfaceMixin
    implements Win32audioPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Win32audioPlatform initialPlatform = Win32audioPlatform.instance;

  test('$MethodChannelWin32audio is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWin32audio>());
  });

  test('getPlatformVersion', () async {
    Win32audio win32audioPlugin = Win32audio();
    MockWin32audioPlatform fakePlatform = MockWin32audioPlatform();
    Win32audioPlatform.instance = fakePlatform;

    expect(await win32audioPlugin.getPlatformVersion(), '42');
  });
}
