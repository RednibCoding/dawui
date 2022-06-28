import 'dart:html';

import 'package:dawui/src/core/common.dart';

import '../../dawui.dart';

class Align extends Widget {
  final Widget child;
  final Alignment alignment;

  Align({required this.child, this.alignment = Alignment.center});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.display = "flex";

    switch (alignment) {
      case Alignment.topLeft:
        div.style.alignItems = "flex-start";
        div.style.justifyContent = "flex-start";
        break;
      case Alignment.topCenter:
        div.style.justifyContent = "center";
        div.style.alignItems = "flex-start";
        break;
      case Alignment.topRight:
        div.style.justifyContent = "end";
        div.style.alignItems = "flex-start";
        break;
      case Alignment.centerLeft:
        div.style.justifyContent = "flex-start";
        div.style.alignItems = "center";
        break;
      case Alignment.center:
        div.style.justifyContent = "center";
        div.style.alignItems = "center";
        break;
      case Alignment.centerRight:
        div.style.justifyContent = "flex-end";
        div.style.alignItems = "center";
        break;
      case Alignment.bottomLeft:
        div.style.justifyContent = "flex-start";
        div.style.alignItems = "flex-end";
        break;
      case Alignment.bottomCenter:
        div.style.justifyContent = "center";
        div.style.alignItems = "flex-end";
        break;
      case Alignment.bottomRight:
        div.style.justifyContent = "flex-end";
        div.style.alignItems = "flex-end";
        break;
    }

    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
