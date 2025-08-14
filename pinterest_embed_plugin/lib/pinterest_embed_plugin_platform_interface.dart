import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pinterest_embed_plugin_method_channel.dart';
import 'package:flutter/widgets.dart';

abstract class PinterestEmbedPluginPlatform extends PlatformInterface {
  /// Constructs a PinterestEmbedPluginPlatform.
  PinterestEmbedPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  // static PinterestEmbedPluginPlatform _instance =
  //     MethodChannelPinterestEmbedPlugin();

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

  Widget buildPinterestEmbed({
    required BuildContext context, 
    required String boardUrl,
    required int boardWidth,
    required int scaleHeight,
    required int scaleWidth,
  }) {
    throw UnimplementedError('buildPinterestEmbed() has not been implemented');
  }

  static PinterestEmbedPluginPlatform _instance = _PlaceholderImplementation(); 
}

// A simple placeholder to prevent errors if the platform implementation isn't set.
class _PlaceholderImplementation extends PinterestEmbedPluginPlatform {
  @override
  Widget buildPinterestEmbed({
    required BuildContext context,
    required String boardUrl,
    required int boardWidth,
    required int scaleHeight,
    required int scaleWidth,
  }) {
    // We return an empty container as a safe fallback.
    return Container();
  }
}
