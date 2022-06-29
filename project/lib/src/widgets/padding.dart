import 'dart:html';

import '../../dawui.dart';

class Padding extends Widget {
  final Widget child;
  final EdgeInsets padding;

  Padding({required this.padding, required this.child});

  @override
  Widget build() {
    final div = DivElement();
    // div.style.width = "inherit";
    // div.style.height = "inherit";
    div.style.padding = "${padding.topValue} ${padding.rightValue} ${padding.bottomValue} ${padding.leftValue}";

    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
