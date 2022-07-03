// ignore_for_file: constant_identifier_names

import 'dart:html';

import '../core/dependencies/dependency_loader.dart';
import '../core/dependencies/prism/prism.coy.css.dart';
import '../core/dependencies/prism/prism.dark.css.dart';
import '../core/dependencies/prism/prism.default.css.dart';
import '../core/dependencies/prism/prism.funky.css.dart';
import '../core/dependencies/prism/prism.okaidia.css.dart';
import '../core/dependencies/prism/prism.solarized_light.css.dart';
import '../core/dependencies/prism/prism.tomorrow_night.css .dart';
import '../core/dependencies/prism/prism.twilight.css .dart';
import '../core/widget.dart';

class CodeArea extends Widget {
  CodeAreaLanguage _language;
  // ignore: prefer_typing_uninitialized_variables
  late final _codeElement;

  // Only needed to forward them to the build method
  final String? _code;
  final String? _width;
  final String? _height;

  CodeArea({
    CodeAreaLanguage language = CodeAreaLanguage.dart,
    CodeAreaTheme theme = CodeAreaTheme.normal,
    String? code,
    String? width,
    String? height,
  })  : _code = code,
        _language = language,
        _width = width,
        _height = height;

  @override
  Widget build() {
    final preElement = PreElement();
    _codeElement = document.createElement("code");
    _codeElement.className = "language-${_language.toString().split('.').last}";
    if (_code != null) {
      _codeElement.innerHtml = _code?.replaceAll("&", "&amp").replaceAll("<", "&lt") ?? "";
    }
    if (_width != null) {
      preElement.style.width = _width;
      _codeElement.style.width = _width;
    }
    if (_height != null) {
      preElement.style.height = _height;
      _codeElement.style.height = _height;
    }

    preElement.append(_codeElement);

    dawuiElement = preElement;
    return this;
  }

  // TODO: this does not work because it needs to rebuild the widget in order for prism to re-generate the tokens for highlighting
  void setLanguage(CodeAreaLanguage language) {
    _language = language;
    dawuiElement?.className = "language-${_language.toString().split('.').last}";
    _codeElement.className = "language-${_language.toString().split('.').last}";
  }

  static void setTheme(CodeAreaTheme theme) {
    final styleElements = document.getElementsByTagName("style");
    for (final style in styleElements) {
      final st = style as StyleElement;
      if (st.innerHtml!.contains("/* PrismJS")) {
        st.remove();
        switch (theme) {
          case CodeAreaTheme.dark:
            DependencyLoader.loadCss(prism_dark_css);
            break;
          case CodeAreaTheme.funky:
            DependencyLoader.loadCss(prism_funky_css);
            break;
          case CodeAreaTheme.okaidia:
            DependencyLoader.loadCss(prism_okaidia_css);
            break;
          case CodeAreaTheme.twilight:
            DependencyLoader.loadCss(prism_twilight_css);
            break;
          case CodeAreaTheme.coy:
            DependencyLoader.loadCss(prism_coy_css);
            break;
          case CodeAreaTheme.soarizedLight:
            DependencyLoader.loadCss(prism_solarized_light_css);
            break;
          case CodeAreaTheme.tomorrowNight:
            DependencyLoader.loadCss(prism_tomorrow_night_css);
            break;
          default:
            DependencyLoader.loadCss(prism_default_css);
            break;
        }
        return;
      }
    }
  }
}

enum CodeAreaTheme {
  normal,
  dark,
  funky,
  okaidia,
  twilight,
  coy,
  soarizedLight,
  tomorrowNight,
}

// Important: enum member names must match the language names used by prism (all in lowercase)
// see: https://prismjs.com/download.html#themes=prism&languages=markup+css+clike+javascript
enum CodeAreaLanguage {
  dart,
  csharp,
  markup,
  html,
  mathml,
  svg,
  xml,
  ssml,
  atom,
  rss,
  clike,
  javascript,
  java,
  js,
  abap,
  ada,
  al,
  antlr4,
  g4,
  apacheconf,
  sql,
  apl,
  aql,
  c,
  arduino,
  ino,
  arff,
  armasm,
  aspnet,
  asm6502,
  asmatmel,
  autohotkey,
  autoit,
  avdl,
  awk,
  gawk,
  basic,
  bbcode,
  shortcode,
  bicep,
  birb,
  bison,
  bnf,
  rbnf,
  brainfuck,
  bro,
  bsl,
  oscript,
  cfscript,
  cfc,
  chaiscript,
  cil,
  clojure,
  cmake,
  cobol,
  concurnas,
  conc,
  csv,
  cypher,
  d,
  dax,
  dhall,
  ebnf,
  eiffel,
  elixir,
  elm,
  lua,
  erlang,
  xlsx,
  xls,
  fsharp,
  fortran,
  gml,
  gap,
  gcode,
  gdscript,
  gedcom,
  gettext,
  po,
  git,
  glsl,
  gn,
  gni,
  ld,
  go,
  graphql,
  haskell,
  hs,
  haxe,
  hcl,
  hlsl,
  hoon,
  hpkp,
  hsts,
  ichigojam,
  icon,
  idris,
  idr,
  inform7,
  ini,
  io,
  j,
  jexl,
  jolie,
  json,
  jsonp,
  julia,
  keepalived,
  keyman,
  kusto,
  less,
  liquid,
  livescript,
  log,
  lolcode,
  magma,
  makefile,
  matlab,
  mel,
  mermaid,
  metafont,
  mizar,
  monkey,
  moonscript,
  moon,
  n1ql,
  n4js,
  n4jsd,
  nasm,
  neon,
  nevod,
  nim,
  nix,
  nsis,
  objectivec,
  objc,
  ocaml,
  openqasm,
  qasm,
  oz,
  parigp,
  pascal,
  psl,
  pcaxis,
  px,
  peoplecode,
  pcode,
  plsql,
  powerquery,
  pq,
  mscript,
  processing,
  prolog,
  properties,
  purebasic,
  pbfasm,
  purescript,
  purs,
  python,
  py,
  qs,
  q,
  qore,
  r,
  racket,
  rkt,
  reason,
  rego,
  renpy,
  rpy,
  rescript,
  res,
  rest,
  rip,
  roboconf,
  scss,
  scala,
  smali,
  smalltalk,
  solidity,
  sol,
  turtle,
  trig,
  sparql,
  rq,
  sqf,
  squirrel,
  stata,
  iecst,
  sclang,
  swift,
  t4,
  vbnet,
  tap,
  tcl,
  twig,
  uc,
  uscript,
  uorazor,
  uri,
  url,
  vala,
  verilog,
  vhdl,
  vim,
  vb,
  vba,
  warpscript,
  wasm,
  wgsl,
  wiki,
  wolfram,
  wl,
  nb,
  ren,
  xojo,
  yang,
}
