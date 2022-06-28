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

class Text extends Widget {
  String _initialText = "";
  SpanElement? _spanElement;
  TextStyle? style;

  String get value => _spanElement?.text ?? "";
  set value(String value) {
    _spanElement?.text = value;
  }

  Text(String text, {this.style}) {
    _initialText = text;
  }

  @override
  Widget build() {
    _spanElement = SpanElement();
    _spanElement!.text = _initialText;

    _applyStyle();
    _applyShadow();

    dawuiElement = _spanElement;
    return this;
  }

  void _applyShadow() {
    if (style != null) {
      if (style!.shadow != null) {
        _spanElement!.style.textShadow = "${style!.shadow!.offsetX} ${style!.shadow!.offsetY} ${style!.shadow!.blurRadius} ${style!.shadow!.color}";
      }
    }
  }

  void _applyStyle() {
    if (style != null) {
      if (style!.fontFamily.isNotEmpty) {
        _spanElement!.style.fontFamily = style!.fontFamily;
      }
      if (style!.fontSize.isNotEmpty) {
        _spanElement!.style.fontSize = style!.fontSize;
      }
      _spanElement!.style.fontStyle = style!.fontStyle.name;
      final fontWeightStr = style!.fontWeight.name.startsWith("w") ? style!.fontWeight.name.substring(1) : style!.fontWeight.name;
      _spanElement!.style.fontWeight = fontWeightStr;

      if (style!.color.isNotEmpty) {
        _spanElement!.style.color = style!.color;
      }
    }
  }
}

class TextStyle {
  String fontFamily;
  String fontSize;
  FontWeight fontWeight;
  FontStyle fontStyle;
  String color;
  TextShadow? shadow;
  TextStyle({this.fontFamily = "", this.fontSize = "", this.color = "", this.fontWeight = FontWeight.normal, this.fontStyle = FontStyle.normal, this.shadow});
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
