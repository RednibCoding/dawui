import 'dart:html';

SpanElement row({required List<Element> children}) {
  var row = SpanElement()..className = "row g-${children.length}";
  for (final child in children) {
    row.children.add(
      SpanElement()
        ..className = "col-auto"
        ..children.add(child),
    );
  }
  return row;
}
