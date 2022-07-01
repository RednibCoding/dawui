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
import '../widgets/dialog.dart';
import 'mdl.dart';

/// the root node of the whole application
///
/// this is required to perform relative `querySelector` calls
/// as the root node might be out of scope for `document.querySelector` in case
/// it is placed in a shadow DOM or frame
late Element root;

/// the modal node that is used to display all popups
late Element modalContainer;
late Element modalContent;

const String _widgetTypeKey = "widget-type";
const String _widgetTypeId = "widget-id";

abstract class Widget {
  Element? dawuiElement;

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
  Element? _buildElement(Widget? parent, [String keyPrefix = ""]) {
    if (this == parent) return null;
    initState();
    final child = build();

    // if dawuiElement is null, this means it is not a widget containing plain html elements
    // This is the case when the user creates it's own widget what derives from Widget and overrides build() to return another widget
    // In this case, we omit creating a new html element, but building the child widget instead
    // We also pass the type annotation from this widget to the child widget, so that it is clear where it came from. Tt would look like this: "MyWidget->ChildWidget"
    // This is useful when observing the html code in the browser
    if (dawuiElement == null) {
      dawuiElement = child._buildElement(this, runtimeType.toString());
    } else {
      // Otherwise, it is a widget that contains plain html elements, so we build the child widget and append it to the dawuiElement
      // Also we take the type annotation from the child widget and add it to the dawuiElement as well
      final childElement = child._buildElement(this);
      if (childElement != null) {
        dawuiElement!.children.add(childElement);
      }
      _annotateType(dawuiElement!, keyPrefix);
    }

    return dawuiElement!;
  }
}

extension _AnnotateElement on Widget {
  void _annotateType(Element element, [String keyPrefix = ""]) {
    if (keyPrefix.isNotEmpty) keyPrefix += "->";
    element.setAttribute(_widgetTypeKey, "$keyPrefix${runtimeType.toString()}");
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

    // Add a placeholder for a modal dialog
    _appendModalPlaceholderTo(root);
  } else {
    throw Exception("Error: Could not build root element.");
  }
}

void _appendModalPlaceholderTo(Element element) {
  // The modal container (takes up the whole screen to prevent interaction, outside of the modal)
  modalContainer = document.createElement("div");
  modalContainer.id = "dawui-modal-container";
  modalContainer.className = "modal";

  // Hide it for now
  modalContainer.style.display = "none";
  // Stay in place
  modalContainer.style.position = "fixed";
  //Sit on top
  modalContainer.style.zIndex = "1";
  modalContainer.style.overflow = "auto";
  // Center the dialog
  modalContainer.style.top = "0";
  modalContainer.style.left = "0";
  modalContainer.style.width = "100%";
  modalContainer.style.height = "100%";
  modalContainer.style.backgroundColor = "rgba(0,0,0)";
  modalContainer.style.backgroundColor = "rgba(0,0,0, 0.2)";

  // The modal content (the dialog box)
  modalContent = document.createElement("div");
  modalContainer.id = "dawui-modal-container";
  modalContent.style.borderRadius = "1px";
  modalContent.style.backgroundColor = "white";
  modalContent.style.position = "absolute";
  modalContent.style.top = "50%";
  modalContent.style.left = "50%";
  modalContent.style.transform = "translate(-50%, -50%)";
  modalContent.style.boxShadow = "0 9px 46px 8px rgb(0 0 0 / 14%), 0 11px 15px -7px rgb(0 0 0 / 12%), 0 24px 38px 3px rgb(0 0 0 / 20%)";

  modalContainer.children.add(modalContent);

  // TODO: make this configurable in case the user want to force the modal to stay open
  window.onClick.listen(
    (event) {
      if (event.target == modalContainer) {
        if (modalContainer.style.display == "block") {
          modalContainer.style.display = "none";
        }
      }
    },
  );

  element.children.add(modalContainer);

  // Make the root fixed and enable scrolling otherwise the modal-dialog-open would cause the page to scroll to the top
  // when position: fixed would be applied there
  element.style.position = "fixed";
  element.style.left = "0";
  element.style.right = "0";
  element.style.overflowY = "auto";
}
