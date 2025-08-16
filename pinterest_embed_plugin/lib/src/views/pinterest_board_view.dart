import 'package:flutter/widgets.dart';
import 'dart:ui_web' as ui;
import 'package:pinterest_embed_plugin/src/scripts/pinterest_script_loader.dart';
import 'package:web/web.dart' as web;

class PinterestBoardView extends StatefulWidget {
  final String boardUrl;
  final int boardWidth;
  final int scaleHeight;
  final int scaleWidth;

  const PinterestBoardView({
    super.key,
    required this.boardUrl,
    required this.boardWidth,
    required this.scaleHeight,
    required this.scaleWidth,
  });

  @override
  State<PinterestBoardView> createState() => _PinterestBoardViewState();
}

class _PinterestBoardViewState extends State<PinterestBoardView> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();

    _viewType = 'pinterest-board-view-${DateTime.now().microsecondsSinceEpoch}';

    ui.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final container = web.document.createElement('div') as web.HTMLDivElement;
      container.style.width = '100%';
      container.style.height = '100%';

      container.style.display = 'flex';
      container.style.justifyContent = 'center';
      container.style.alignItems = 'center';

      final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
      anchor.setAttribute('data-pin-do', 'embedBoard');
      anchor.setAttribute('data-pin-board-width', widget.boardWidth.toString());
      anchor.setAttribute(
        'data-pin-scale-height',
        widget.scaleHeight.toString(),
      );
      anchor.setAttribute('data-pin-scale-width', widget.scaleWidth.toString());
      anchor.href = widget.boardUrl;
      container.appendChild(anchor);

      // Load Pinterest script
      PinterestScriptLoader.ensureScriptAndHydrate();

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => PinterestScriptLoader.ensureScriptAndHydrate(),
      );

      return container;
    });
  }

  @override
  void didUpdateWidget(covariant PinterestBoardView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If props changed (like boardUrl, dimensions, etc.), rehydrate
    if (oldWidget.boardUrl != widget.boardUrl ||
        oldWidget.boardWidth != widget.boardWidth ||
        oldWidget.scaleHeight != widget.scaleHeight ||
        oldWidget.scaleWidth != widget.scaleWidth) {
      PinterestScriptLoader.ensureScriptAndHydrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: HtmlElementView(viewType: _viewType),
    );
  }
}
