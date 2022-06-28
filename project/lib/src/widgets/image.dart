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

const fallbackImg =
    "data:image/png;base64,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";

class Image extends Widget {
  String _width;
  String _height;
  String _opacity;
  final String source;
  // String? _altSource;
  final void Function(Widget sender)? onPressed;
  final void Function(Widget sender)? onMouseEnter;
  final void Function(Widget sender)? onMouseLeave;
  bool _isMouseHovering = false;

  bool get isMouseHovering => _isMouseHovering;
  String get width => _width;
  String get height => _height;
  String get opacity => _opacity;

  set width(String value) {
    _width = value;
    _imgElement!.style.width = _width;
  }

  set height(String value) {
    _height = value;
    _imgElement!.style.height = _height;
  }

  set opacity(String value) {
    _opacity = value;
    _imgElement!.style.opacity = _opacity;
  }

  ImageElement? _imgElement;

  Image(this.source, {String width = "", String height = "", String opacity = "1", this.onPressed, this.onMouseEnter, this.onMouseLeave})
      : _width = width,
        _height = height,
        _opacity = opacity;

  @override
  Widget build() {
    _imgElement = ImageElement();
    _imgElement!.src = source;
    _imgElement!.style.opacity = _opacity;

    if (_width.isNotEmpty) {
      _imgElement!.style.width = _width;
    }

    if (_height.isNotEmpty) {
      _imgElement!.style.height = _height;
    }

    // When the provided source cannot be found, onerror will automatically be called
    // NOTE: this is also true for the fallbackImg, so be carefull not to create an infinite loop here
    _imgElement!.onError.listen((event) {
      // TODO: find a way to prevent an endless loop when the fallbackImg can also not be found. Only then we can provide an altSource parameter so the user can provide his own fallback image
      _imgElement!.src = fallbackImg;
      _imgElement!.style.width = "64px";
      _imgElement!.style.height = "64px";
    });

    _imgElement!.onClick.listen((event) {
      onPressed?.call(this);
    });

    _imgElement!.onMouseEnter.listen((event) {
      if (!_isMouseHovering) {
        _isMouseHovering = true;
        onMouseEnter?.call(this);
      }
    });

    _imgElement!.onMouseLeave.listen((event) {
      if (_isMouseHovering) {
        _isMouseHovering = false;
        onMouseLeave?.call(this);
      }
    });

    _width = _imgElement!.style.width;
    _height = _imgElement!.style.height;
    _opacity = _imgElement!.style.opacity;

    dawuiElement = _imgElement!;
    return this;
  }
}
