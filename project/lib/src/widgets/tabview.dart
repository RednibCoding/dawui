import 'dart:html';

import '../core/helper.dart';
import '../core/mdl.dart';
import '../core/widget.dart';

class TabView extends Widget {
  final List<TabViewItem> tabViewItems;

  TabView({required this.tabViewItems});

  @override
  Widget build() {
    final mainTabContainer = DivElement();
    mainTabContainer.className = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect";
    final tabbar = DivElement();
    tabbar.className = "mdl-tabs__tab-bar";
    for (final tab in tabViewItems) {
      tabbar.children.add(tab._tabHead);
    }

    mainTabContainer.children.add(tabbar);

    for (final tabPanels in tabViewItems) {
      mainTabContainer.children.add(tabPanels.asHtmlElement());
    }

    convertToMdlComponent(mainTabContainer);

    dawuiElement = mainTabContainer;
    return this;
  }
}

class TabViewItem extends Widget {
  final Widget title;
  final Widget body;
  final bool isActive;
  final String _internalId;
  final Element _tabHead;
  TabViewItem({required this.title, required this.body, this.isActive = false})
      : _internalId = makeUid(),
        _tabHead = document.createElement("a") {
    _tabHead.className = "mdl-tabs__tab ${isActive ? "is-active" : ""}";
    _tabHead.setAttribute("href", "#$_internalId");
    _tabHead.children.add(title.asHtmlElement());
  }

  @override
  Widget build() {
    final div = DivElement();
    div.className = "mdl-tabs__panel ${isActive ? "is-active" : ""}";
    div.id = _internalId;
    div.children.add(body.asHtmlElement());

    convertToMdlComponent(div);

    dawuiElement = div;
    return this;
  }
}
