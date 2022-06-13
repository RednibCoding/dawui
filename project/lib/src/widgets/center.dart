import 'dart:html';

import '../../dawui.dart';

class Center extends Widget {
  final Widget child;

  Center({required this.child});

  @override
  Widget build() {
    final div = DivElement();
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.display = "flex";
    div.style.alignItems = "center";
    div.style.justifyContent = "center";
    div.children.add(child.asHtmlElement());

    dawuiElement = div;
    return this;
  }
}
