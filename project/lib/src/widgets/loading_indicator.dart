import 'dart:html';

import 'package:dawui/dawui.dart';
import 'package:dawui/src/core/mdl.dart';

class LoadingIndicator extends Widget {
  final bool isSpinner;
  final bool spinnerMulticolor;
  final String width;

  LoadingIndicator({this.isSpinner = false, this.spinnerMulticolor = false, this.width = ""});

  @override
  Widget build() {
    final div = DivElement();

    if (isSpinner) {
      if (width.isNotEmpty) {
        print("Warning on LoadingIndicator Widget: width has no effect when isSpinner is true");
      }
      if (spinnerMulticolor) {
        div.className = "mdl-spinner mdl-js-spinner is-active";
      } else {
        div.className = "mdl-spinner mdl-spinner--single-color mdl-js-spinner is-active";
      }
    } else {
      div.className = "mdl-progress mdl-js-progress mdl-progress__indeterminate";
      div.style.width = width.isNotEmpty ? width : "250px";
    }

    convertToMdlComponent(div);

    dawuiElement = div;
    return this;
  }
}
