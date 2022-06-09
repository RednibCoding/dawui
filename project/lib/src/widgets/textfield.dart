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

import '../core/helper.dart';
import '../core/mdl.dart';
import '../core/widget.dart';

enum TextFieldType {
  text,
  password,
  number,
  // email,
  // tel,
  // url,
  // search,
  // date,
  // time,
  // datetime,
  // month,
  // week,
  // color,
}

class TextField extends _TextField {
  TextField({TextFieldType type = TextFieldType.text, String label = "", String pattern = "", String errorText = "", String width = ""})
      : super(
          width: width,
          type: type,
          label: label,
          pattern: pattern,
          errorText: errorText,
          className: "mdl-textfield mdl-js-textfield",
        );
}

class _TextField extends Widget {
  final TextFieldType type;
  final String className;
  final String pattern;
  final String label;
  final String errorText;
  final String width;

  _TextField({required this.className, required this.type, required this.label, required this.pattern, required this.errorText, required this.width});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = width;
    div.className = className;

    final inputId = makeUid();
    final input = InputElement();
    input.style.width = "100%";
    input.className = "mdl-textfield__input";
    input.type = type.toString().split('.').last;
    input.id = inputId;
    if (pattern != "") {
      input.pattern = pattern;
    }

    final label = LabelElement();
    label.className = "mdl-textfield__label";
    label.setAttribute("for", inputId);
    label.text = this.label;

    SpanElement? span;
    // Only add error text if there is pattern that cannot be matched
    if (errorText != "" && pattern != "") {
      span = SpanElement();
      span.className = "mdl-textfield__error";
      span.text = errorText;
    }

    div.children.add(input);
    div.children.add(label);
    if (span != null) {
      div.children.add(span);
    }

    convertToMdlComponent(div);

    dawuiElement = div;
    return this;
  }
}
