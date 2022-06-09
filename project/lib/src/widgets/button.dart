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
import '../core/mdl.dart';
import '../core/widget.dart';

class ColoredActionButton extends _Button {
  ColoredActionButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored",
        );
}

class ActionButton extends _Button {
  ActionButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect",
        );
}

class RaisedButton extends _Button {
  RaisedButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect",
        );
}

class ColoredButton extends _Button {
  ColoredButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect",
        );
}

class AccentButton extends _Button {
  AccentButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent",
        );
}

class FlatButton extends _Button {
  FlatButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-js-ripple-effect",
        );
}

class ColoredFlatButton extends _Button {
  ColoredFlatButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--primary mdl-js-ripple-effect",
        );
}

class AccentFlatButton extends _Button {
  AccentFlatButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--accent mdl-js-ripple-effect",
        );
}

class MiniActionButton extends _Button {
  MiniActionButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-js-ripple-effect",
        );
}

class ColoredMiniActionButton extends _Button {
  ColoredMiniActionButton({required String text, void Function()? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          text: text,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored mdl-js-ripple-effect",
        );
}

class _Button extends Widget {
  final String className;
  final String text;
  final bool disabled;
  final String width;
  final String height;
  final void Function()? onPressed;

  _Button({required this.text, required this.className, this.onPressed, this.disabled = false, this.width = "", this.height = ""});

  @override
  Widget build() {
    final span = SpanElement();
    final button = ButtonElement();
    button.text = text;
    if (width != "") {
      button.style.width = width;
      span.style.width = width;
    }
    if (height != "") {
      button.style.height = height;
      span.style.height = height;
    }
    button.type = "button";
    button.disabled = disabled;
    button.className = className;
    button.onClick.listen((_) => onPressed?.call());
    convertToMdlComponent(button);
    span.children.add(button);

    dawuiElement = span;
    return this;
  }
}
