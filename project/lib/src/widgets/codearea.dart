// ignore_for_file: constant_identifier_names

import 'dart:html';

import '../core/widget.dart';

class CodeArea extends Widget {
  final SourceLanguage language;
  late final _codeElement;

  // Only needed to forward them to the build method
  final String? _code;
  final String? _width;
  final String? _height;

  String get code => _codeElement.innerText ?? "";
  set code(String value) {
    _codeElement.innerText = value;
  }

  CodeArea({
    this.language = SourceLanguage.dart,
    String? code,
    String? width,
    String? height,
  })  : _code = code,
        _width = width,
        _height = height;

  @override
  Widget build() {
    final preElement = PreElement();
    _codeElement = document.createElement("code");
    _codeElement.className = "language-${language.toString().split('.').last}";
    if (_code != null) {
      _codeElement.innerText = _code;
    }
    if (_width != null) {
      preElement.style.width = _width;
      _codeElement.style.width = _width;
    }
    if (_height != null) {
      preElement.style.height = _height;
      _codeElement.style.height = _height;
    }

    preElement.append(_codeElement);

    dawuiElement = preElement;
    return this;
  }
}

// Important: enum member names must match the language names used by prism (all in lowercase)
// see: https://prismjs.com/download.html#themes=prism&languages=markup+css+clike+javascript
enum SourceLanguage {
  dart,
  css,
  html,
  clike,
  c,
  csharp,
  go,
  gomodule,
  java,
  python,
  json,
  makefile,
  doker,
  xml,
  markup,
  docker,
  toml,
}
