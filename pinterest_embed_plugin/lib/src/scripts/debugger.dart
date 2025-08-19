import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'package:web/web.dart' as web;


void debugPrintJSObject(JSAny? obj) {
  if (obj == null || obj.isUndefinedOrNull) {
    print("❌ JS object is null/undefined");
    return;
  }

  try {
    // Get JSON global object
    final jsonObj = (web.window as JSObject).getProperty<JSObject>('JSON'.toJS);

    // Get stringify function
    final stringifyFn =
        jsonObj.getProperty<JSFunction>('stringify'.toJS);

    // Call JSON.stringify(obj)
    final str = stringifyFn.callAsFunction(jsonObj, obj);

    print("🔍 JSObject contents: $str");
  } catch (e) {
    print("⚠️ Could not stringify object: $e");
  }
}

void debugPrintKeys(JSAny? obj) {
  if (obj == null || obj.isUndefinedOrNull) {
    print("❌ JS object is null/undefined");
    return;
  }

  final objectCtor = (web.window as JSObject).getProperty<JSObject>(
    'Object'.toJS,
  );
  final keysFn = objectCtor.getProperty<JSFunction>('keys'.toJS);

  final keys = keysFn.callAsFunction(objectCtor, obj) as JSArray;
  print("🔑 Keys: ${(keys.toDart as List).join(', ')}");
}
