import 'dart:html';

import 'package:dawui/dawui.dart';

class Text extends Widget {
  String _initialText = "";
  SpanElement? _spanElement;

  String get value => _spanElement?.text ?? "";
  set value(String value) {
    _spanElement?.text = value;
  }

  Text(String text) {
    _initialText = text;
  }

  @override
  Widget build() {
    _spanElement = SpanElement();
    _spanElement!.text = _initialText;

    dawuiElement = _spanElement;
    return this;
  }
}
