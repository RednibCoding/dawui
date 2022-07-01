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

class Chip extends Widget {
  final String label;
  final bool deleteble;
  final bool isButton;
  final bool isContact;
  final String avatarText;
  final String avatarImg;
  final Function(Widget sender)? onDelete;

  Chip(this.label, {this.deleteble = false, this.isButton = false, this.isContact = false, this.avatarText = "?", this.avatarImg = "", this.onDelete});

  @override
  Widget build() {
    final mainElement = isButton ? ButtonElement() : SpanElement();
    mainElement.className = "mdl-chip";

    final textLabel = SpanElement();
    textLabel.className = "mdl-chip__text";
    textLabel.text = label;

    if (!deleteble && onDelete != null) {
      print("Warning on Chip Widget: onDelete has no effect when deleteble is false");
    }

    if (isButton) {
      mainElement.children.add(textLabel);
      if (deleteble) {
        print("Warning on Chip Widget: deleteble has no effect when isButton is true");
      }
      if (isContact) {
        print("Warning on Chip Widget: isContact has no effect when isButton is true");
      }
      dawuiElement = mainElement;
      return this;
    }

    mainElement.className = "mdl-chip ${deleteble ? "mdl-chip--deletable" : ""} ${isContact ? "mdl-chip--contact" : ""}";

    if (isContact) {
      if (avatarImg.isNotEmpty) {
        final avatar = ImageElement();
        avatar.className = "mdl-chip__contact";
        avatar.src = avatarImg;
        mainElement.children.add(avatar);
      } else {
        final avatar = SpanElement();
        // TODO: make color configurable
        avatar.className = "mdl-chip__contact mdl-color--teal mdl-color-text--white";
        avatar.text = avatarText;
        mainElement.children.add(avatar);
      }
    }

    mainElement.children.add(textLabel);

    if (deleteble) {
      final deleteButton = ButtonElement();
      deleteButton.type = "Button";
      deleteButton.className = "mdl-chip__action";
      deleteButton.text = "x";
      deleteButton.onClick.listen((e) {
        onDelete?.call(this);
        mainElement.remove();
      });
      mainElement.children.add(deleteButton);
    }

    dawuiElement = mainElement;
    return this;
  }
}
