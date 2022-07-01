import 'dart:html';

import 'package:dawui/src/theming/theme.dart';

import '../theming/style.dart';
import '../widgets/dialog.dart';
import 'widget.dart';

/// Creates a new app and appends it to the body element.
/// The [args] contain all attributes of the HTML element.
/// [widgetBuilder] is a function that returns the root widget of the app.
/// The [theme] is the theme to apply to the application.
void buildApp(Widget Function(Map<String, String> args) widgetBuilder, {Theme? theme}) {
  initStyle(theme);

  final appId = "dawui-app";
  var target = document.createElement("div");
  target.style.width = "100%";
  target.style.height = "100%";
  target.id = appId;
  document.body?.append(target);

  root = target;
  var rootWidget = widgetBuilder(root.dataset);
  var rootElement = rootWidget.buildElement(null);
  if (rootElement != null) {
    root.children = [rootElement];

    // Add a placeholder for a modal dialog
    Dialog.register(root);
  } else {
    throw Exception("Error: Could not build root element.");
  }
}
