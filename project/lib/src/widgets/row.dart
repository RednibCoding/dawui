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

import '../core/widget.dart';
import '../core/common.dart';

class Row extends Widget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool reverse;

  Row({required this.children, this.mainAxisAlignment = MainAxisAlignment.start, this.crossAxisAlignment = CrossAxisAlignment.start, this.reverse = false});

  @override
  Widget build() {
    final span = SpanElement();
    span.style.overflow = "hidden";
    span.style.width = "100%";
    span.style.display = "flex";
    span.style.flexWrap = "nowrap";
    span.style.flexDirection = reverse ? "row-reverse" : "row";
    span.style.justifyContent = mainAxisAlignmentToString(mainAxisAlignment);
    span.style.alignItems = crossAxisAlignmentToString(crossAxisAlignment);
    for (final child in children) {
      span.children.add(child.asHtmlElement());
    }
    dawuiElement = span;
    return this;
  }
}
