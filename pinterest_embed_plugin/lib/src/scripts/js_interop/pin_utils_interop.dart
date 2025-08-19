@JS('PinUtils')
library;

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'package:web/web.dart' as web;

@JS()
@staticInterop
class PinUtils {}

extension PinUtilsExtension on PinUtils {
  external void build();
}

/// Get PinUtils safely
PinUtils? getPinUtils() {
  final jsObj = (web.window as JSObject).getProperty<JSAny?>('PinUtils'.toJS);

  if (jsObj == null || jsObj.isUndefinedOrNull) {
    print("⚠️ PinUtils not available yet");
    return null;
  }

  // Verify that PinUtils.build is actually defined
  final buildFn = (jsObj as JSObject).getProperty<JSAny?>('build'.toJS);
  if (buildFn == null || buildFn.isUndefinedOrNull) {
    print("⚠️ PinUtils exists but build() is not ready yet");
    return null;
  }

  print("✅ build() is available: $buildFn");

  var pinUtils = jsObj as PinUtils;

  return pinUtils;
}
