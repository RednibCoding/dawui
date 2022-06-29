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

class SizedBox extends Widget {
  final String width;
  final String height;
  final Widget? child;
  final String? backgroundColor;
  final String? borderRadius;
  final String? border;
  final String? borderColor;
  final BoxShadow? shadow;
  SizedBox({this.width = "", this.height = "", this.child, this.backgroundColor, this.borderRadius, this.border, this.shadow, this.borderColor});

  @override
  Widget build() {
    final div = DivElement();
    div.style.overflow = "hidden";
    if (width != "") {
      div.style.width = width;
    }
    if (height != "") {
      div.style.height = height;
    }

    if (backgroundColor != null) {
      div.style.backgroundColor = backgroundColor;
    }

    if (borderRadius != null) {
      div.style.borderRadius = borderRadius!;
    }

    if (border != null && borderColor != null) {
      div.style.border = "${border!} solid ${borderColor!}";
    }

    if (shadow != null) {
      div.style.boxShadow =
          "${shadow!.offsetX} ${shadow!.offsetY} ${shadow!.blurRadius} ${shadow!.spreadRadius} ${shadow!.color} ${shadow!.inset ? "inset" : ""}";
    }

    if (child != null) {
      div.children.add(child!.asHtmlElement());
    }

    dawuiElement = div;
    return this;
  }
}
