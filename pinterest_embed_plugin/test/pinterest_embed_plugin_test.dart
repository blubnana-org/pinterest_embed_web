import 'package:flutter_test/flutter_test.dart';
import 'package:pinterest_embed_plugin/pinterest_embed_plugin.dart';
import 'package:pinterest_embed_plugin/pinterest_embed_plugin_platform_interface.dart';
import 'package:pinterest_embed_plugin/pinterest_embed_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPinterestEmbedPluginPlatform
    with MockPlatformInterfaceMixin
    implements PinterestEmbedPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PinterestEmbedPluginPlatform initialPlatform = PinterestEmbedPluginPlatform.instance;

  test('$MethodChannelPinterestEmbedPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPinterestEmbedPlugin>());
  });

  test('getPlatformVersion', () async {
    PinterestEmbedPlugin pinterestEmbedPlugin = PinterestEmbedPlugin();
    MockPinterestEmbedPluginPlatform fakePlatform = MockPinterestEmbedPluginPlatform();
    PinterestEmbedPluginPlatform.instance = fakePlatform;

    expect(await pinterestEmbedPlugin.getPlatformVersion(), '42');
  });
}
