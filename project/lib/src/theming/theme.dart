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

import 'style.dart';
import 'style.dynamic.css.dart';

// Button
const _fallbackBtnColorPrimary = "#3F51B5";
const _fallbackBtnColorSecondary = "#46B6AC";
const _fallbackBtnColorAccent = "#FF4081";

// TextField
const _fallbackTextFieldBorderColor = "#3F51B5";
// TextArea
const _fallbackTextAreaBorderColor = "#3F51B5";
// TabView
const _fallbacktabviewBorderColor = "#3F51B5";

/// Theming class for the application.
/// Themes can be created and applied to the application.
class Theme {
  final String btnColorPrimary;
  final String btnColorSecondary;
  final String btnColorAccent;
  final String textFieldBorderColor;
  final String textAreaBorderColor;
  final String tabviewBorderColor;

  Theme({
    this.btnColorPrimary = _fallbackBtnColorPrimary,
    this.btnColorSecondary = _fallbackBtnColorSecondary,
    this.btnColorAccent = _fallbackBtnColorAccent,
    this.textFieldBorderColor = _fallbackTextFieldBorderColor,
    this.textAreaBorderColor = _fallbackTextAreaBorderColor,
    this.tabviewBorderColor = _fallbacktabviewBorderColor,
  });

  /// Applies the theme to the application.
  void apply() {
    dawuiStyle.remove();
    final cssDynamic = processStyle(dawuiCssDynamic, this);
    dawuiStyle.innerText = cssDynamic;
    document.head?.append(dawuiStyle);
  }
}
