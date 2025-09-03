import 'package:flutter/widgets.dart';

import 'pinterest_embed_plugin_platform_interface.dart';

class PinterestEmbed extends StatelessWidget {
  final String boardUrl;
  final int boardWidth;
  final int scaleHeight;
  final int scaleWidth;

  const PinterestEmbed({
    super.key,
    required this.boardUrl,
    this.boardWidth = 1920,
    this.scaleHeight = 1080,
    this.scaleWidth = 80,
  });

  @override
  Widget build(BuildContext context) {
    return PinterestEmbedPluginPlatform.instance.buildPinterestEmbed(
      context: context,
      boardUrl: boardUrl,
      boardWidth: boardWidth,
      scaleHeight: scaleHeight,
      scaleWidth: scaleWidth,
    );
  }

}
