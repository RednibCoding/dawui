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

class Scaffold extends Widget {
  final Widget? header;
  final Widget body;
  final Widget? footer;

  Scaffold({required this.body, this.header, this.footer});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.display = "flex";
    div.style.flexDirection = "column";
    div.style.justifyContent = "space-between";
    div.style.alignItems = "stretch";
    if (header != null) {
      div.children.add(header!.asHtmlElement());
    }
    div.children.add(body.asHtmlElement());
    if (footer != null) {
      div.children.add(footer!.asHtmlElement());
    }

    dawuiElement = div;
    return this;
  }
}
