import 'dart:html';

import 'package:dawui/dawui.dart';

class Badge extends Widget {
  final String badge;
  final Widget child;

  Badge(
    this.badge,
    this.child,
  );

  @override
  Widget build() {
    final span = SpanElement();
    span.className = "mdl-badge";
    span.setAttribute("data-badge", badge);
    span.children.add(child.asHtmlElement());

    dawuiElement = span;
    return this;
  }
}
