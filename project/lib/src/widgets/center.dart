import 'dart:html';

import '../../dawui.dart';

class Center extends Widget {
  final Widget child;
  final bool vertical;
  final bool horizontal;

  Center({required this.child, this.horizontal = true, this.vertical = true});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.display = "flex";
    div.style.alignItems = vertical ? "center" : "flex-start";
    div.style.justifyContent = horizontal ? "center" : "flex-start";
    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
