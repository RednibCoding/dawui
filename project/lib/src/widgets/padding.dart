import 'dart:html';

import '../../dawui.dart';

class Padding extends Widget {
  final Widget child;
  final EdgeInsets padding;

  Padding.all({required this.padding, required this.child});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.display = "flex";
    div.style.padding = "${padding.topValue} ${padding.rightValue} ${padding.bottomValue} ${padding.leftValue}";

    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
