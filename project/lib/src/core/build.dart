// MIT License

// Copyright (c) 2022 RednibCoding

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:html';

import 'package:dawui/src/core/dependencies/dependency_loader.dart';
import 'package:dawui/src/core/dependencies/prism/prism.js.dart';
import 'package:dawui/src/theming/theme.dart';

import '../theming/style.dart';
import '../widgets/dialog.dart';
import 'dependencies/prism/prism.css.dart';
import 'widget.dart';

/// Creates a new app and appends it to the body element.
/// The [args] contain all attributes of the HTML element.
/// [widgetBuilder] is a function that returns the root widget of the app.
/// The [theme] is the theme to apply to the application.
void buildApp(Widget Function(Map<String, String> args) widgetBuilder, {Theme? theme}) {
  initStyle(theme);
  DependencyLoader.loadCss(prism_css);
  DependencyLoader.loadJs(prism_js);

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
