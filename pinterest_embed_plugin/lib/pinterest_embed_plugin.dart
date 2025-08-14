
import 'pinterest_embed_plugin_platform_interface.dart';

class PinterestEmbedPlugin {
  Future<String?> getPlatformVersion() {
    return PinterestEmbedPluginPlatform.instance.getPlatformVersion();
  }
}
