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
      var styleClass = "text-style${makeUid()}";
      var styleBuffer = StringBuffer();
      styleBuffer.write(".$styleClass {\n");

      if (style!.fontFamily.isNotEmpty) {
        styleBuffer.write("  font-family: ${style!.fontFamily};\n");
      }

      styleBuffer.write("  font-size: ${style!.fontSize}px;\n");

      styleBuffer.write("  line-height: ${(style!.fontSize * 1.2).toString()}px;\n");

      styleBuffer.write("  font-style: ${style!.fontStyle.name};\n");

      final fontWeightStr = style!.fontWeight.name.startsWith("w") ? style!.fontWeight.name.substring(1) : style!.fontWeight.name;
      styleBuffer.write("  font-weight: $fontWeightStr;\n");

      if (style!.color.isNotEmpty) {
        final color = style!.color.startsWith("#") ? hex2rgb(style!.color) : style!.color;
        styleBuffer.write("  color: rgb($color);\n");
      }

      if (style!.shadow != null) {
        final shadowColor = style!.shadow!.color.startsWith("#") ? hex2rgb(style!.shadow!.color) : style!.shadow!.color;
        styleBuffer.write("  text-shadow: ${style!.shadow!.offsetX} ${style!.shadow!.offsetY} ${style!.shadow!.blurRadius} rgb($shadowColor);\n");
      }

      document.head?.children.add(StyleElement()..text = styleBuffer.toString());

      _textContainerElement!.classes.add(styleClass);
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
