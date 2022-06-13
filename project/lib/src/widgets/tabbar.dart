import 'dart:html';

import '../core/helper.dart';
import '../core/mdl.dart';
import '../core/widget.dart';

class TabBar extends Widget {
  List<TabBarItem>? tabBarItems;
  Function(int oldIndex, int newIndex)? onTabChanged;

  int _oldIndex = 0;
  int _currentIndex = 0;

  int get index => _currentIndex;

  TabBar({this.tabBarItems, this.onTabChanged});

  @override
  Widget build() {
    final mainTabContainer = DivElement();
    mainTabContainer.className = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect";
    final tabbar = DivElement();
    tabbar.className = "mdl-tabs__tab-bar";

    var tabIndex = 0;
    if (tabBarItems != null) {
      for (final tab in tabBarItems!) {
        tab._parent = this;
        tab._index = tabIndex++;
        if (tab.isActive) {
          _currentIndex = tab._index;
        }
        tabbar.children.add(tab._tabHead);
      }
    }

    mainTabContainer.children.add(tabbar);

    // These dummies are required, otherwise mdl throws an error when tabbar navigation items do not have a corresponding tab panel.
    // TODO: find a way to avoid this.
    for (final tabPanel in tabBarItems ?? []) {
      mainTabContainer.children.add(SpanElement()
        ..id = tabPanel._internalId
        ..style.display = "none");
    }

    convertToMdlComponent(mainTabContainer);

    dawuiElement = mainTabContainer;
    return this;
  }
}

class TabBarItem {
  final Widget title;
  final bool isActive;
  final String _internalId;
  final Element _tabHead;
  TabBar? _parent;
  int _index = 0;

  TabBarItem({required this.title, this.isActive = false})
      : _internalId = makeUid(),
        _tabHead = document.createElement("a") {
    _tabHead.className = "mdl-tabs__tab ${isActive ? "is-active" : ""}";
    _tabHead.setAttribute("href", "#$_internalId");

    _tabHead.onClick.listen((_) {
      if (_parent != null) {
        _parent!._oldIndex = _parent!._currentIndex;
        _parent!._currentIndex = _index;
        if (_parent!.onTabChanged != null) {
          _parent!.onTabChanged!(_parent!._oldIndex, _parent!._currentIndex);
        }
      }
    });

    _tabHead.children.add(title.asHtmlElement());
  }
}
