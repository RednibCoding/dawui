import 'dart:html';
import 'package:dawui/dawui.dart';
import 'package:dawui/src/core/dependencies/mdl/mdl_helper.dart';
import 'package:dawui/src/core/helper.dart';

class NavbarScrollableTabs extends Widget {
  final Widget title;
  final List<NavbarTabItem> navbarTabItems;

  NavbarScrollableTabs({required this.title, required this.navbarTabItems});

  @override
  Widget build() {
    final layoutContainer = DivElement();
    layoutContainer.className = "mdl-layout__container";

    final container = DivElement();
    container.className = "mdl-layout mdl-js-layout mdl-layout--fixed-header";

    layoutContainer.children.add(container);

    final header = document.createElement("header");
    header.className = "mdl-layout__header";

    container.children.add(header);

    final headerRow = DivElement();
    headerRow.className = "mdl-layout__header-row";

    final titleSpan1 = SpanElement();
    titleSpan1.className = "mdl-layout-title";
    titleSpan1.children.add(title.asHtmlElement());

    headerRow.children.add(titleSpan1);
    header.children.add(headerRow);

    final tabbar = DivElement();
    tabbar.className = "mdl-layout__tab-bar mdl-js-ripple-effect";
    for (final tab in navbarTabItems) {
      tabbar.children.add(tab._tabHead);
    }

    header.children.add(tabbar);

    final drawer = DivElement();
    drawer.className = "mdl-layout__drawer";

    final titleSpan2 = SpanElement();
    titleSpan2.className = "mdl-layout-title";
    titleSpan2.children.add(title.asHtmlElement());
    drawer.children.add(titleSpan2);

    container.children.add(drawer);

    final main = document.createElement("main");
    main.className = "mdl-layout__content";
    for (final tab in navbarTabItems) {
      main.children.add(tab.asHtmlElement());
    }

    container.children.add(main);

    MdlHelper.convertToMdlComponent(container);

    dawuiElement = container;
    return this;
  }
}

class NavbarTabItem extends Widget {
  final Widget title;
  final Widget content;
  final bool isActive;
  final void Function(Widget sender)? onPressed;
  final Element _tabHead;
  late final Element _tabContent;
  final String _uId;
  // bool _clicked = false;

  NavbarTabItem({required this.title, required this.content, this.isActive = false, this.onPressed})
      : _tabHead = document.createElement("a"),
        _uId = makeUid() {
    _tabHead.className = "mdl-layout__tab ${isActive ? "is-active" : ""}";
    _tabHead.setAttribute("href", "#$_uId");
    _tabHead.children.add(title.asHtmlElement());
  }

  @override
  Widget build() {
    _tabContent = document.createElement("section");
    _tabContent.className = "mdl-layout__tab-panel ${isActive ? "is-active" : ""}";
    _tabContent.id = _uId;

    final contentPage = DivElement();
    contentPage.className = "page-content";
    contentPage.children.add(content.asHtmlElement());
    _tabContent.children.add(contentPage);

    dawuiElement = _tabContent;
    return this;
  }
}

// class NavbarTabItem extends Widget {
//   final Widget _title;
//   final Widget _content;
//   final Element _titleElement;
//   final Element _contentElement;
//   final bool _isActive;

//   NavbarTabItem({required Widget title, required Widget content, bool isActive = false})
//       : _title = title,
//         _content = content,
//         _isActive = isActive,
//         _titleElement = document.createElement("a"),
//         _contentElement = document.createElement("section");

//   @override
//   Widget build() {
//     final uId = makeUid();
//     _titleElement.className = "mdl-layout__tab ${_isActive ? "is-active" : ""}";
//     _titleElement.setAttribute("href", "#$uId");
//     _titleElement.children.add(_title.asHtmlElement());

//     _contentElement.className = "mdl-layout__tab-panel ${_isActive ? "is-active" : ""}";
//     _contentElement.id = uId;
//     final contentPage = DivElement();
//     contentPage.className = "page-content";
//     contentPage.children.add(_content.asHtmlElement());
//     _contentElement.children.add(contentPage);
//     return this;
//   }
// }
