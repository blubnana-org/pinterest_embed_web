import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pinterest_embed_plugin_platform_interface.dart';

/// An implementation of [PinterestEmbedPluginPlatform] that uses method channels.
class MethodChannelPinterestEmbedPlugin extends PinterestEmbedPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pinterest_embed_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<HydrationState?> getStatus() async {
    final status = await methodChannel.invokeMethod<HydrationState>(
      'getPinterestWidgetStatus',
    );
    return status;
  }

  @override
  Future<void> hydrateWidget() async {
    await methodChannel.invokeMethod<HydrationState>('hydrateWidget');
  }

}
