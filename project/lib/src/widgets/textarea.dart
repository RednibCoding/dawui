import 'dart:html';

import '../core/widget.dart';

class TextArea extends Widget {
  TextareaResize resize;
  void Function(Widget sender)? onChange;
  String width;
  String height;
  late final TextAreaElement _inputElement;
  final int maxLength;
  final bool autofocus;

  // Only needed to forward the values to the build method.
  final String _value;
  final bool _disabled;
  final bool _readOnly;

  String get value => _inputElement.value ?? "";
  set value(String value) {
    _inputElement.value = value;
  }

  bool get disabled => _inputElement.disabled;
  set disabled(bool value) {
    _inputElement.disabled = value;
  }

  bool get readOnly => _inputElement.readOnly;
  set readOnly(bool value) {
    _inputElement.readOnly = value;
  }

  bool get hasFocus => document.activeElement == _inputElement;
  void focus() => _inputElement.focus();

  TextArea(
      {bool disabled = false,
      bool readOnly = false,
      this.autofocus = false,
      this.onChange,
      String value = "",
      this.width = "",
      this.height = "",
      this.resize = TextareaResize.none,
      this.maxLength = -1})
      : _value = value,
        _disabled = disabled,
        _readOnly = readOnly;

  @override
  Widget build() {
    _inputElement = TextAreaElement();
    _inputElement.className = "dawui-textarea";
    _inputElement.disabled = _disabled;
    _inputElement.autofocus = autofocus;
    _inputElement.readOnly = _readOnly;
    _inputElement.style.width = width;
    _inputElement.style.height = height;
    _inputElement.style.resize = resize.toString().split('.').last;
    _inputElement.value = _value;
    _inputElement.onInput.listen((e) {
      onChange?.call(this);
    });

    if (maxLength > -1) {
      _inputElement.maxLength = maxLength;
    }

    dawuiElement = _inputElement;
    return this;
  }
}

enum TextareaResize {
  none,
  vertical,
  horizontal,
  both,
}
