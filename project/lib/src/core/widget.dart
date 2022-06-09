// MIT License

// Copyright (c) 2021 RednibCoding

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

/// Flutter-like widgets for building UIs with HTML elements. Define the [build]
/// method to create a new widget.
/// ```dart
/// class MyPage extends Widget {
///   @override
///   Element build() => paragraphElement(text: "My Awesome Page");
/// }
/// ```
abstract class Widget {
  Widget? get parent => _parent;
  Widget? _parent;

  /// Method which needs to be defined by the developer to describe the UI
  /// using HTML Elements. It is **not** recommended to use this method to
  /// append your widget in the [build] method of another widget! Use [appendTo]
  /// for this!
  Element build();

  /// Override this method to initialize the state of this widget. The [parent]
  /// value is already set when this method is called.
  void initState() {
    return;
  }

  /// Use this method inside of the [build] method of the parent widget to
  /// append this widget to it. This creates a widget tree and makes it possible
  /// to use the [findParent()] method.
  Element context(Widget parent, [Object? cacheKey]) {
    _parent = parent;
    initState();
    return wrapTyped();
  }

  /// Looks up the widget tree until it finds a parent of this type or otherwise
  /// throws an exception. Make sure that this widget has been appended by the
  /// [context()] method first.
  T findParent<T>() {
    final parentPointer = parent;
    if (parentPointer == null) {
      throw Exception('Unable to find parent of type $T in widget tree. Have you appended this widget with `.build()` instead of `.appendTo(this)` maybe?');
    }
    if (parentPointer is T) {
      return parentPointer as T;
    }
    return parentPointer.findParent<T>();
  }

  /// Checks if this widget instance is still mounted to the DOM.
  bool get isMounted => root.querySelector('[$_dataWidgetTypeId="${hashCode.toString()}"]') != null;

  @override
  String toString() => build().toString();
}

const String _dataWidgetTypeKey = 'data-widget-type';
const String _dataWidgetTypeId = 'data-widget-id';

extension _WrapTyped on Widget {
  Element wrapTyped() {
    var element = build();
    if (element.hasAttribute(_dataWidgetTypeKey) || element.hasAttribute(_dataWidgetTypeId)) {
      element = SpanElement()..children.add(element);
    }
    return element
      ..setAttribute(_dataWidgetTypeKey, runtimeType.toString())
      ..setAttribute(_dataWidgetTypeId, hashCode.toString());
  }
}

/// Creates a new app and appends it to the body element.
/// The [args] contain all attributes of the HTML element.
void runApp(Widget Function(Map<String, String> args) widgetBuilder) {
  final appId = "dawui-app";
  var target = document.createElement("div");
  target.id = appId;
  document.body?.append(target);

  initMdl();

  root = target;
  final rootWidget = widgetBuilder(root.dataset);
  rootWidget.initState();
  root.children = [rootWidget.wrapTyped()];
}

// void _appendMaterialDesignLocal() {
//   // For reference, see: https://getmdl.io

//   // Add meta viewport tag to the document so mobile devices will render correctly.
//   final meta = MetaElement();
//   meta.name = "viewport";
//   meta.content = "width=device-width, initial-scale=1.0";
//   document.head?.append(meta);

//   // Append material icons (this is needed by the material library)
//   final linkIcons = LinkElement();
//   linkIcons.rel = "stylesheet";
//   linkIcons.href = "https://fonts.googleapis.com/icon?family=Material+Icons";

//   // Append material css
//   final linkCSS = LinkElement();
//   linkCSS.rel = "stylesheet";
//   linkCSS.href = "packages/dawui/src/mdl/material.min.css";
//   document.head?.append(linkCSS);

//   // Append material js
//   final script = ScriptElement();
//   script.defer = true;
//   script.src = "packages/dawui/src/mdl/material.min.js";
//   document.head?.append(script);
// }
