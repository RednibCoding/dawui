import 'dart:html';

import 'package:dawui/dawui.dart';

class Badge extends Widget {
  final String badgeText;
  final Widget child;

  Badge(
    this.badgeText,
    this.child,
  );

  @override
  Widget build() {
    final span = SpanElement();
    span.className = "mdl-badge";
    span.setAttribute("data-badge", badgeText);
    span.children.add(child.asHtmlElement());

    dawuiElement = span;
    return this;
  }
}
