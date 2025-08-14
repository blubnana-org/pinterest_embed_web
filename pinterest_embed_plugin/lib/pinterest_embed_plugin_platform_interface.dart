import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pinterest_embed_plugin_method_channel.dart';

abstract class PinterestEmbedPluginPlatform extends PlatformInterface {
  /// Constructs a PinterestEmbedPluginPlatform.
  PinterestEmbedPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PinterestEmbedPluginPlatform _instance = MethodChannelPinterestEmbedPlugin();

  /// The default instance of [PinterestEmbedPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPinterestEmbedPlugin].
  static PinterestEmbedPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PinterestEmbedPluginPlatform] when
  /// they register themselves.
  static set instance(PinterestEmbedPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
