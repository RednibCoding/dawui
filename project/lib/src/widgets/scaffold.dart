import 'dart:html';

import '../../dawui.dart';

class Scaffold extends Widget {
  final List<Widget> children;
  final String? backgroundColor;

  Scaffold({required this.children, this.backgroundColor});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";

    if (backgroundColor != null) {
      div.style.backgroundColor = backgroundColor;
    }

    for (final child in children) {
      div.children.add(child.asHtmlElement());
    }

    dawuiElement = div;
    return this;
  }
}
