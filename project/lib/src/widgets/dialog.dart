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

import 'package:dawui/dawui.dart';

/// A barebones Dialog that can be used to display a modal dialog.
/// Only one open dialog at any given time is supported for now.
class Dialog {
  static late final Element _modalBackdrop;
  static late final Element _modalBox;

  /// Shows the dialog.
  /// The [widget] is the widget to display in the dialog.
  /// Before showing, the old [widget] is removed from the dialog.
  static void show(Widget content) {
    _modalBox.children.clear();
    final htmlContent = content.asHtmlElement();
    _modalBox.children.add(htmlContent);
    _modalBackdrop.style.display = "block";
  }

  /// Hides the dialog.
  /// The [widget] that has been set in [show] will not be removed and will be available until the next call to [show].
  static void close() {
    _modalBackdrop.style.display = "none";
  }

  /// This method is called by the framework to register the dialog.
  /// This should not be called by the user
  static void register(Element element) {
    _Placeholder.register(element);
  }
}

extension _Placeholder on Dialog {
  static int timesCalled = 0;
  static void register(Element element) {
    if (timesCalled > 1) {
      throw Exception("Only one dialog can be registered");
    }
    // The modal container (takes up the whole screen to prevent interaction, outside of the modal)
    Dialog._modalBackdrop = document.createElement("div");
    Dialog._modalBackdrop.className = "dawui-modal-backdrop";

    // The modal content (the dialog box)
    Dialog._modalBox = document.createElement("div");
    Dialog._modalBox.className = "dawui-modal-box";

    Dialog._modalBackdrop.children.add(Dialog._modalBox);

    // TODO: make this configurable in case the user want to force the modal to stay open until the user takes an action
    window.onClick.listen(
      (event) {
        if (event.target == Dialog._modalBackdrop) {
          if (Dialog._modalBackdrop.style.display == "block") {
            Dialog._modalBackdrop.style.display = "none";
          }
        }
      },
    );

    element.children.add(Dialog._modalBackdrop);

    // Make the root fixed and enable scrolling otherwise the modal-dialog-open would cause the page to scroll to the top
    // when position: fixed would be applied there
    element.style.position = "fixed";
    element.style.left = "0";
    element.style.right = "0";
    element.style.overflowY = "auto";

    timesCalled++;
  }
}
