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

class TextField extends Widget {
  final TextFieldType type;
  final String label;
  final int maxLength;
  void Function(Widget sender)? onChange;
  late final InputElement _inputElement;
  final bool autofocus;

  // Only needed to forward the values to the build method.
  final String _value;
  final String _width;
  final bool _disabled;
  final bool _readOnly;

  String get value => _inputElement.value ?? "";
  set value(String value) {
    _inputElement.value = value;
  }

  bool get readOnly => _inputElement.readOnly ?? false;
  set readOnly(bool value) {
    _inputElement.readOnly = value;
  }

  bool get disabled => _inputElement.disabled ?? false;
  set disabled(bool value) {
    _inputElement.disabled = value;
  }

  bool get hasFocus => document.activeElement == _inputElement;
  void focus() => _inputElement.focus();

  TextField(
      {this.type = TextFieldType.text,
      this.label = "",
      this.autofocus = false,
      String width = "",
      this.maxLength = -1,
      bool disabled = false,
      bool readOnly = false,
      this.onChange,
      String value = ""})
      : _value = value,
        _width = width,
        _disabled = disabled,
        _readOnly = readOnly;

  @override
  Widget build() {
    final inputId = makeUid();
    _inputElement = InputElement();
    _inputElement.disabled = _disabled;
    _inputElement.readOnly = _readOnly;
    _inputElement.style.width = "100%";
    _inputElement.className = "dawui-textfield";
    _inputElement.type = type.toString().split('.').last;
    _inputElement.id = inputId;
    _inputElement.value = _value;
    _inputElement.autofocus = autofocus;

    _inputElement.onInput.listen((e) {
      onChange?.call(this);
    });

    if (maxLength > -1) {
      _inputElement.maxLength = maxLength;
    }

    if (_width.isNotEmpty) {
      _inputElement.style.width = _width;
    }

    _inputElement.placeholder = label;

    dawuiElement = _inputElement;
    return this;
  }
}
