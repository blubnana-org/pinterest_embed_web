// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:async';

import 'package:pinterest_embed_plugin/src/scripts/js_interop/pin_utils_interop.dart';
import 'package:pinterest_embed_plugin/src/utils/hydration_state.dart';
import 'package:web/web.dart' as web;

class PinterestScriptLoader {
  static const String _scriptId = 'pinterest-pinit-js';
  static const String _scriptSrc = 'https://assets.pinterest.com/js/pinit.js';

  static final StreamController<HydrationState> _controller =
      StreamController.broadcast();

  static Stream<HydrationState> get hydrationStream => _controller.stream;

  static void ensureScriptAndHydrate() {
    final existing = web.document.getElementById(_scriptId);

    if (existing == null) {
      final script =
          web.document.createElement('script') as web.HTMLScriptElement;
      script.id = _scriptId;
      script.async = true;
      script.defer = true;
      script.src = _scriptSrc;

      // When script finishes loading, hydrate embeds
      script.onLoad.listen((_) {
        _controller.add(HydrationState.loading);
        _tryHydrate();
      });

      (web.document.head ?? web.document.body ?? web.document).appendChild(
        script,
      );
    } else {
      // If script is already present, just hydrate
      _tryHydrate();
    }
  }

  static void _tryHydrate({int attempts = 7, int delayMs = 400}) {
    if (attempts <= 0) {
      _controller.add(HydrationState.error);
      return;
    }

    try {
      final pinUtils = getPinUtils();

      if (pinUtils != null) {
        
        pinUtils.build();

        _controller.add(HydrationState.success);
        return;
      } else {
        throw Exception("PinUtils is not yet ready.");
      }
    } catch (err) {
      print(
        "[Pinterest] Hydration failed. attempt $attempts,\nError: $err \nretry Delay $delayMs",
      );

      Future.delayed(Duration(milliseconds: delayMs), () {
        _tryHydrate(attempts: attempts - 1, delayMs: (delayMs * 1.5).toInt());
      });
    }
  }
}
