import 'dart:html';
import 'dart:js' as js;

class MdlHelper {
  static void convertToMdlComponent(Element element) {
    js.JsObject? componentHandler = js.context["componentHandler"];
    if (componentHandler == null) {
      print("Error: componentHandler is null");
      return;
    }

    componentHandler.callMethod("upgradeElement", [
      element,
    ]);
  }
}
