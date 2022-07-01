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

import 'package:dawui/src/core/helper.dart';
import 'package:dawui/src/theming/style.static.css.dart';

import 'style.dynamic.css.dart';
import 'theme.dart';

late StyleElement dawuiStyle;

void initStyle(Theme? theme) {
  // Add meta viewport tag to the document so mobile devices will render correctly.
  final meta = MetaElement();
  meta.name = "viewport";
  meta.content = "width=device-width, initial-scale=1.0";
  document.head?.append(meta);

  // Append css
  dawuiStyle = StyleElement();
  final cssDynamic = processStyle(dawuiCssDynamic, theme);
  dawuiStyle.innerText = cssDynamic;
  final staticCss = StyleElement();
  staticCss.innerText = dawuiCssStatic;
  document.head?.append(dawuiStyle);
  document.head?.append(staticCss);
}

String processStyle(String css, Theme? theme) {
  final th = theme ?? Theme();
  css = css.replaceFirst("?btnColorPrimary?", th.btnColorPrimary.startsWith("#") ? hex2rgb(th.btnColorPrimary) : th.btnColorPrimary);
  css = css.replaceFirst("?btnColorSecondary?", th.btnColorSecondary.startsWith("#") ? hex2rgb(th.btnColorSecondary) : th.btnColorSecondary);
  css = css.replaceFirst("?btnColorAccent?", th.btnColorAccent.startsWith("#") ? hex2rgb(th.btnColorAccent) : th.btnColorAccent);
  return css;
}
