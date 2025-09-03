import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinterest_embed_plugin/pinterest_embed.dart';
import 'package:pinterest_embed_plugin/pinterest_embed_plugin_platform_interface.dart';
import 'package:pinterest_embed_plugin/pinterest_embed_plugin_method_channel.dart';
import 'package:pinterest_embed_plugin/src/utils/hydration_state.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPinterestEmbedPluginPlatform
    with MockPlatformInterfaceMixin
    implements PinterestEmbedPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Widget buildPinterestEmbed({
    required BuildContext context,
    required String boardUrl,
    required int boardWidth,
    required int scaleHeight,
    required int scaleWidth,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<HydrationState?> getStatus() {
    throw UnimplementedError();
  }

  @override
  Future<void> hydrateWidget() {
    throw UnimplementedError();
  }
  
}

void main() {
  final PinterestEmbedPluginPlatform initialPlatform =
      PinterestEmbedPluginPlatform.instance;

  test('$MethodChannelPinterestEmbedPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPinterestEmbedPlugin>());
  });
}
