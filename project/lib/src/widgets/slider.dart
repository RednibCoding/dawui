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
