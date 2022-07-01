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

  Widget build();

  void initState() {
    return;
  }

  Element asHtmlElement() {
    return buildElement(null) ?? SpanElement();
  }

  @override
  String toString() => build().toString();
}

extension BuildElement on Widget {
  Element? buildElement(Widget? parent, [String keyPrefix = ""]) {
    if (this == parent) return null;
    initState();
    final child = build();

    // if dawuiElement is null, this means it is not a widget containing plain html elements
    // This is the case when the user creates it's own widget what derives from Widget and overrides build() to return another widget
    // In this case, we omit creating a new html element, but building the child widget instead
    // We also pass the type annotation from this widget to the child widget, so that it is clear where it came from. Tt would look like this: "MyWidget->ChildWidget"
    // This is useful when observing the html code in the browser
    if (dawuiElement == null) {
      dawuiElement = child.buildElement(this, runtimeType.toString());
    } else {
      // Otherwise, it is a widget that contains plain html elements, so we build the child widget and append it to the dawuiElement
      // Also we take the type annotation from the child widget and add it to the dawuiElement as well
      final childElement = child.buildElement(this);
      if (childElement != null) {
        dawuiElement!.children.add(childElement);
      }
      annotateType(dawuiElement!, keyPrefix);
    }

    return dawuiElement!;
  }
}

extension _AnnotateElement on Widget {
  void annotateType(Element element, [String keyPrefix = ""]) {
    if (keyPrefix.isNotEmpty) keyPrefix += "->";
    element.setAttribute(_widgetTypeKey, "$keyPrefix${runtimeType.toString()}");
    element.setAttribute(_widgetTypeId, hashCode.toString());
  }
}
