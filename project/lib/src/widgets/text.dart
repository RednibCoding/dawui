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
import 'package:dawui/src/core/helper.dart';

class Text extends Widget {
  String _initialText = "";
  TextStyle? style;
  dynamic _textContainerElement;
  // By default browsers style a paragraph with a margin at the bottom, usually 16px;
  bool isParagraph;

  String get value => _textContainerElement?.text ?? "";
  set value(String value) {
    _textContainerElement?.text = value;
  }

  Text(String text, {this.style, this.isParagraph = false}) {
    _initialText = text;
  }

  @override
  Widget build() {
    _textContainerElement = isParagraph ? ParagraphElement() : SpanElement();
    _textContainerElement!.text = _initialText;

    _applyStyle();

    dawuiElement = _textContainerElement;
    return this;
  }

  void _applyStyle() {
    if (style != null) {
      if (style!.fontFamily.isNotEmpty) {
        _textContainerElement!.style.fontFamily = style!.fontFamily;
      }

      _textContainerElement!.style.fontSize = "${style!.fontSize}px";

      _textContainerElement!.style.lineHeight = "${(style!.fontSize * 1.2).toString()}px";

      _textContainerElement!.style.fontStyle = style!.fontStyle.name;

      final fontWeightStr = style!.fontWeight.name.startsWith("w") ? style!.fontWeight.name.substring(1) : style!.fontWeight.name;
      _textContainerElement!.style.fontWeight = fontWeightStr;

      if (style!.color.isNotEmpty) {
        final color = style!.color.startsWith("#") ? hex2rgb(style!.color) : style!.color;
        _textContainerElement!.style.color = "rgb($color)";
      }

      if (style!.shadow != null) {
        final shadowColor = style!.shadow!.color.startsWith("#") ? hex2rgb(style!.shadow!.color) : style!.shadow!.color;
        _textContainerElement!.style.textShadow = "${style!.shadow!.offsetX} ${style!.shadow!.offsetY} ${style!.shadow!.blurRadius} rgb($shadowColor)";
      }
    }
  }
}

class TextStyle {
  String fontFamily;
  int fontSize;
  FontWeight fontWeight;
  FontStyle fontStyle;
  String color;
  TextShadow? shadow;
  bool alphaInherit = true;
  TextStyle({this.fontFamily = "", this.fontSize = 18, this.color = "", this.fontWeight = FontWeight.normal, this.fontStyle = FontStyle.normal, this.shadow});
}

class TextShadow {
  String color;
  String offsetX;
  String offsetY;
  String blurRadius;
  TextShadow({required this.offsetX, required this.offsetY, this.blurRadius = "0px", this.color = "#000000"});
}

enum TextAlign {
  left,
  right,
  center,
}

enum FontWeight {
  normal,
  bold,
  lighter,
  bolder,
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900,
  inherit,
}

enum FontStyle {
  normal,
  italic,
  inherit,
}
