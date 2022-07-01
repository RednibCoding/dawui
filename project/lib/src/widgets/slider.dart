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

class Slider extends Widget {
  final String min;
  final String max;
  final String step;
  final String width;
  final String _value;
  InputElement? _inputElement;
  String get value => _inputElement?.value ?? _value;
  Function(String)? onChange;

  Slider({this.min = "0", this.max = "100", String value = "0", this.width = "", this.step = "1", this.onChange}) : _value = value;

  @override
  Widget build() {
    _inputElement = InputElement();
    _inputElement!.type = "range";
    _inputElement!.style.background = "transparent";
    _inputElement!.style.height = "5px";
    _inputElement!.min = min;
    _inputElement!.max = max;
    _inputElement!.step = step;
    _inputElement!.value = _value;
    _inputElement!.onInput.listen((_) {
      onChange?.call(_inputElement!.value ?? "0");
    });

    if (width.isNotEmpty) {
      _inputElement!.style.width = width;
    }

    dawuiElement = _inputElement;
    return this;
  }
}
