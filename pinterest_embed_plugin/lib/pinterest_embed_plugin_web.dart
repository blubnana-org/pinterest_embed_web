// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:pinterest_embed_plugin/src/views/pinterest_board_view.dart';
import 'package:web/web.dart' as web;

import 'pinterest_embed_plugin_platform_interface.dart';

/// A web implementation of the PinterestEmbedPluginPlatform of the PinterestEmbedPlugin plugin.
class PinterestEmbedPluginWeb extends PinterestEmbedPluginPlatform {
  /// Constructs a PinterestEmbedPluginWeb
  PinterestEmbedPluginWeb();

  static void registerWith(Registrar registrar) {
    PinterestEmbedPluginPlatform.instance = PinterestEmbedPluginWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }

  @override
  Widget buildPinterestEmbed({
    required BuildContext context,
    required String boardUrl,
    required int boardWidth,
    required int scaleHeight,
    required int scaleWidth,
  }) {
    return PinterestBoardView(
      boardUrl: boardUrl,
      boardWidth: boardWidth,
      scaleHeight: scaleHeight,
      scaleWidth: scaleWidth,
    );
  }
}
