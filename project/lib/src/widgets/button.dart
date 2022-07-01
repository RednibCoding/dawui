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
import '../core/widget.dart';

class FlatButton extends _Button {
  FlatButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button",
        );
}

class PrimaryButton extends _Button {
  PrimaryButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--raised dawui-button--primary",
        );
}

class SecondaryButton extends _Button {
  SecondaryButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--raised dawui-button--secondary",
        );
}

class AccentButton extends _Button {
  AccentButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--raised dawui-button--accent",
        );
}

class FlatActionButton extends _Button {
  FlatActionButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--action",
        );
}

class PrimaryActionButton extends _Button {
  PrimaryActionButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--primary dawui-button--action",
        );
}

class SecondaryActionButton extends _Button {
  SecondaryActionButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--secondary dawui-button--action",
        );
}

class AccentActionButton extends _Button {
  AccentActionButton({required Widget child, void Function(Widget sender)? onPressed, bool disabled = false, String width = "", String height = ""})
      : super(
          child: child,
          width: width,
          height: height,
          onPressed: onPressed,
          disabled: disabled,
          className: "dawui-button dawui-button--accent dawui-button--action",
        );
}

class _Button extends Widget {
  final Widget child;
  String _className = "";
  String _initialWidth = "";
  String _initialHeight = "";
  bool _initialDisabled = false;
  ButtonElement? _buttonElement;
  SpanElement? _spanElement;
  final void Function(Widget sender)? onPressed;

  bool get disabled => _buttonElement?.disabled ?? false;
  set disabled(bool value) => _buttonElement?.disabled = value;

  String get width => _buttonElement?.style.width ?? "";
  String get height => _buttonElement?.style.height ?? "";
  set width(String value) {
    _spanElement?.style.width = value;
    _buttonElement?.style.width = value;
  }

  set height(String value) {
    _spanElement?.style.height = value;
    _buttonElement?.style.height = value;
  }

  _Button({required this.child, required String className, this.onPressed, bool disabled = false, String width = "", String height = ""}) {
    _initialWidth = width;
    _initialHeight = height;
    _initialDisabled = disabled;
    _className = className;
  }

  @override
  Widget build() {
    _spanElement = SpanElement();
    _buttonElement = ButtonElement();
    _buttonElement!.children.add(child.asHtmlElement());
    if (_initialWidth != "") {
      _buttonElement!.style.width = _initialWidth;
      _spanElement!.style.width = _initialWidth;
    }
    if (_initialHeight != "") {
      _buttonElement!.style.height = _initialHeight;
      _spanElement!.style.height = _initialHeight;
    }
    _buttonElement!.type = "button";
    _buttonElement!.disabled = _initialDisabled;
    _buttonElement!.className = _className;
    _buttonElement!.onClick.listen((event) {
      onPressed?.call(this);
    });

    _spanElement!.children.add(_buttonElement!);

    dawuiElement = _spanElement!;
    return this;
  }
}
