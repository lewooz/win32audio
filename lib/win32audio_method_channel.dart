import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'win32audio_platform_interface.dart';

/// An implementation of [Win32audioPlatform] that uses method channels.
class MethodChannelWin32audio extends Win32audioPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('win32audio');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
