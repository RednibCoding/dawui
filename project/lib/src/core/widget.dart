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
import 'mdl.dart';

/// the root node of the whole application
///
/// this is required to perform relative `querySelector` calls
/// as the root node might be out of scope for `document.querySelector` in case
/// it is placed in a shadow DOM or frame
late Element root;

const String _widgetTypeKey = "widget-type";
const String _widgetTypeId = "widget-id";

abstract class Widget {
  Element? dawuiElement;
  Widget? childWidget;

  Widget build();

  void initState() {
    return;
  }

  Element asHtmlElement() {
    return _buildElement(null) ?? SpanElement();
  }

  @override
  String toString() => build().toString();
}

extension _BuildElement on Widget {
  Element? _buildElement(Widget? parent) {
    if (this == parent) return null;
    initState();
    childWidget = build();
    dawuiElement ??= SpanElement();
    _annotateType(dawuiElement!);
    final childElement = childWidget!._buildElement(this);
    if (childElement != null) {
      dawuiElement!.children.add(childElement);
    }
    return dawuiElement!;
  }
}

extension _AnnotateElement on Widget {
  void _annotateType(Element element) {
    element.setAttribute(_widgetTypeKey, runtimeType.toString());
    element.setAttribute(_widgetTypeId, hashCode.toString());
  }
}

/// Creates a new app and appends it to the body element.
/// The [args] contain all attributes of the HTML element.
void runApp(Widget Function(Map<String, String> args) widgetBuilder) {
  initMdl();
  final appId = "dawui-app";
  var target = document.createElement("div");
  target.style.width = "100%";
  target.style.height = "100%";
  target.id = appId;
  document.body?.append(target);

  root = target;
  var rootWidget = widgetBuilder(root.dataset);
  var rootElement = rootWidget._buildElement(null);
  if (rootElement != null) {
    root.children = [rootElement];
  } else {
    throw Exception("No dawui-app element found");
  }
}
