import 'dart:html';

import 'style.dart';
import 'style.dynamic.css.dart';

const _fallbackBtnColorPrimary = "#3F51B5";
const _fallbackBtnColorSecondary = "#46B6AC";
const _fallbackBtnColorAccent = "#FF4081";

/// Theming class for the application.
/// Themes can be created and applied to the application.
class Theme {
  final String btnColorPrimary;
  final String btnColorSecondary;
  final String btnColorAccent;

  Theme({
    this.btnColorPrimary = _fallbackBtnColorPrimary,
    this.btnColorSecondary = _fallbackBtnColorSecondary,
    this.btnColorAccent = _fallbackBtnColorAccent,
  });

  /// Applies the theme to the application.
  void apply() {
    dawuiStyle.remove();
    final cssDynamic = processStyle(dawuiCssDynamic, this);
    dawuiStyle.innerText = cssDynamic;
    document.head?.append(dawuiStyle);
  }
}
