import 'dart:html';

import '../../dawui.dart';

class Scaffold extends Widget {
  final List<Widget> children;

  Scaffold({required this.children});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";

    for (final child in children) {
      div.children.add(child.asHtmlElement());
    }

    dawuiElement = div;
    return this;
  }
}
