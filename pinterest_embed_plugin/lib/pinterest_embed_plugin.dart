import 'package:pinterest_embed_plugin/pinterest_embed_plugin_platform_interface.dart';

class PinterestEmbedPlugin {
  //Ensure it's not callable on it's own
  PinterestEmbedPlugin._();

  static Future<HydrationState?> getStatus() async {
    return PinterestEmbedPluginPlatform.instance.getStatus();
  }

  static Future<void> hydrateWidget() async {
    await PinterestEmbedPluginPlatform.instance.hydrateWidget();
  }

  static Future<String?> getVersion() async {
    return await PinterestEmbedPluginPlatform.instance.getPlatformVersion();
  }

}
