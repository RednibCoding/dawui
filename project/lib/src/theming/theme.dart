const _fallbackBtnColorPrimary = "63,81,181";
const _fallbackBtnColorSecondary = "70,182,172";
const _fallbackBtnColorAccent = "255,64,129";

class Theme {
  final String btnColorPrimary;
  final String btnColorSecondary;
  final String btnColorAccent;

  Theme({
    this.btnColorPrimary = _fallbackBtnColorPrimary,
    this.btnColorSecondary = _fallbackBtnColorSecondary,
    this.btnColorAccent = _fallbackBtnColorAccent,
  });
}
