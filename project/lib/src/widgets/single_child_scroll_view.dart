import 'dart:html';

import '../../dawui.dart';

class SingleChildScrollView extends Widget {
  final Widget child;
  final bool vertical;
  final bool horizontal;

  SingleChildScrollView({required this.child, this.horizontal = false, this.vertical = true});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.overflowX = horizontal ? "auto" : "hidden";
    div.style.overflowY = vertical ? "auto" : "hidden";
    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
