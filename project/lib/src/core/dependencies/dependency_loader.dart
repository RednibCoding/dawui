import 'dart:html';

class DependencyLoader {
  static void loadJs(String jsSourceCode) {
    final scriptElement = ScriptElement();
    scriptElement.type = "text/javascript";
    scriptElement.innerText = jsSourceCode;
    scriptElement.defer = true;
    document.head?.append(scriptElement);
  }

  static void loadCss(String cssSourceCode) {
    final styleElement = StyleElement();
    styleElement.type = "text/css";
    styleElement.innerText = cssSourceCode;
    document.head?.append(styleElement);
  }
}
