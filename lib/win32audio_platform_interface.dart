import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'win32audio_method_channel.dart';

abstract class Win32audioPlatform extends PlatformInterface {
  /// Constructs a Win32audioPlatform.
  Win32audioPlatform() : super(token: _token);

  static final Object _token = Object();

  static Win32audioPlatform _instance = MethodChannelWin32audio();

  /// The default instance of [Win32audioPlatform] to use.
  ///
  /// Defaults to [MethodChannelWin32audio].
  static Win32audioPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Win32audioPlatform] when
  /// they register themselves.
  static set instance(Win32audioPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
