// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:web/web.dart' as web;

class PinterestScriptLoader {
  static const String _scriptId = 'pinterest-pinit-js';
  static const String _scriptSrc = 'https://assets.pinterest.com/js/pinit.js';

  static void ensureScriptAndHydrate() {
    final existing = web.document.getElementById(_scriptId);

    if (existing == null) {
      final script = web.document.createElement('script') as web.HTMLScriptElement;
      script.id = _scriptId;
      script.async = true;
      script.defer = true;
      script.src = _scriptSrc;
      (web.document.head ?? web.document.body ?? web.document).appendChild(script);
    } else {
      // Pinterest global object is created by pinit.js
      try {
        (web.window as dynamic).PinUtils?.build();
      } catch (_) {
        // Safe fallback — nothing breaks if Pinterest API changes
      }
    }
  }
}
