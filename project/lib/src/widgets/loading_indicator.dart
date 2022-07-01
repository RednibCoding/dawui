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

class LoadingIndicator extends Widget {
  final bool isSpinner;
  final bool spinnerMulticolor;
  final String width;

  LoadingIndicator({this.isSpinner = false, this.spinnerMulticolor = false, this.width = ""});

  @override
  Widget build() {
    final div = DivElement();

    if (isSpinner) {
      if (width.isNotEmpty) {
        print("Warning on LoadingIndicator Widget: width has no effect when isSpinner is true");
      }
      if (spinnerMulticolor) {
        div.className = "mdl-spinner mdl-js-spinner is-active";
      } else {
        div.className = "mdl-spinner mdl-spinner--single-color mdl-js-spinner is-active";
      }
    } else {
      div.className = "mdl-progress mdl-js-progress mdl-progress__indeterminate";
      div.style.width = width.isNotEmpty ? width : "250px";
    }

    dawuiElement = div;
    return this;
  }
}
