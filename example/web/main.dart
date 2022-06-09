import 'dart:html';

import 'package:dawui/dawui.dart';

import 'main_page.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  @override
  Element build() {
    return MainState.router.context(this);
  }
}

class MainState {
  static Router router = Router(
    routeBuilder: (route) {
      switch (route) {
        case "/":
          return MainPage();
        default:
          return NotFoundPage();
      }
    },
    initialRoute: "/",
  );
}

class NotFoundPage extends Widget {
  @override
  Element build() => ParagraphElement()..text = "404: Not found";
}
