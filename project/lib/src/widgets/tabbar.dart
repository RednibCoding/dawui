// MIT License

// Copyright (c) 2022 RednibCoding

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:html';

import '../core/helper.dart';
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
