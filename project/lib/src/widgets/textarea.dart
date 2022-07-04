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

import '../core/dependencies/mdl/mdl_helper.dart';
import '../core/helper.dart';
import '../core/widget.dart';

class TextArea extends _TextField {
  TextArea(
      {bool resizeable = false,
      String label = "",
      String pattern = "",
      String errorText = "",
      String width = "",
      String height = "",
      void Function(Widget sender)? onChange,
      String value = ""})
      : super(
          width: width,
          height: height,
          resizeable: resizeable,
          label: label,
          onChange: onChange,
          value: value,
          className: "mdl-textfield mdl-js-textfield mdl-textfield--floating-label",
        );
}

class _TextField extends Widget {
  bool resizeable;
  final String className;
  final String label;
  final String width;
  final String height;
  void Function(Widget sender)? onChange;
  TextAreaElement? _inputElement;
  String _initialValue = "";

  String get value => _inputElement?.value ?? "";
  set value(String value) {
    _inputElement?.value = value;
  }

  _TextField(
      {required this.resizeable, required this.className, required this.label, required this.width, required this.height, this.onChange, String value = ""}) {
    _initialValue = value;
  }

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = width;
    div.className = className;

    final inputId = makeUid();
    _inputElement = TextAreaElement();
    _inputElement!.style.resize = resizeable ? "vertical" : "none";
    _inputElement!.style.width = "100%";
    _inputElement!.className = "mdl-textfield__input";
    _inputElement!.id = inputId;
    _inputElement!.value = _initialValue;
    _inputElement!.onInput.listen((e) {
      onChange?.call(this);
    });

    final label = LabelElement();
    label.className = "mdl-textfield__label";
    label.setAttribute("for", inputId);
    label.text = this.label;

    div.children.add(_inputElement!);
    div.children.add(label);

    MdlHelper.convertToMdlComponent(div);

    dawuiElement = div;
    return this;
  }
}
