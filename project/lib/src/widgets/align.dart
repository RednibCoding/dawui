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

import '../../dawui.dart';

class Align extends Widget {
  final Widget child;
  final Alignment alignment;

  Align({required this.child, this.alignment = Alignment.center});

  @override
  Widget build() {
    final div = DivElement();
    div.style.overflow = "hidden";
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.display = "flex";

    switch (alignment) {
      case Alignment.topLeft:
        div.style.alignItems = "flex-start";
        div.style.justifyContent = "flex-start";
        break;
      case Alignment.topCenter:
        div.style.justifyContent = "center";
        div.style.alignItems = "flex-start";
        break;
      case Alignment.topRight:
        div.style.justifyContent = "end";
        div.style.alignItems = "flex-start";
        break;
      case Alignment.centerLeft:
        div.style.justifyContent = "flex-start";
        div.style.alignItems = "center";
        break;
      case Alignment.center:
        div.style.justifyContent = "center";
        div.style.alignItems = "center";
        break;
      case Alignment.centerRight:
        div.style.justifyContent = "flex-end";
        div.style.alignItems = "center";
        break;
      case Alignment.bottomLeft:
        div.style.justifyContent = "flex-start";
        div.style.alignItems = "flex-end";
        break;
      case Alignment.bottomCenter:
        div.style.justifyContent = "center";
        div.style.alignItems = "flex-end";
        break;
      case Alignment.bottomRight:
        div.style.justifyContent = "flex-end";
        div.style.alignItems = "flex-end";
        break;
    }

    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
