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

import '../core/widget.dart';

class TabView extends Widget {
  final void Function(Widget sender)? onPressed;
  final List<TabViewItem> tabViewItems;

  TabView({required this.tabViewItems, this.onPressed});

  @override
  Widget build() {
    final mainTabContainer = DivElement();
    mainTabContainer.className = "dawui-tabs";
    final tabbar = DivElement();
    tabbar.className = "dawui-tabs__tab-bar";
    for (final tab in tabViewItems) {
      tab._tabHead.onClick.listen((_) {
        for (final t in tabViewItems) {
          t._tabHead.classes.remove("dawui-tabs__tab-head--active");
          t._tabContent.classes.remove("dawui-tabs__tab-content--active");
          t._tabContent.classes.add("dawui-tabs__tab-content");
          t._clicked = false;
        }
        tab._tabHead.classes.add("dawui-tabs__tab-head--active");
        tab._tabContent.classes.remove("dawui-tabs__tab-content");
        tab._tabContent.classes.add("dawui-tabs__tab-content--active");
        tab._clicked = true;
      });
      tabbar.children.add(tab._tabHead);
    }

    tabbar.onClick.listen((_) {
      final clickedTab = tabViewItems.firstWhere((t) => t._clicked);
      onPressed?.call(clickedTab);
    });

    mainTabContainer.children.add(tabbar);

    for (final tabContent in tabViewItems) {
      mainTabContainer.children.add(tabContent.asHtmlElement());
    }

    dawuiElement = mainTabContainer;
    return this;
  }
}

class TabViewItem extends Widget {
  final Widget title;
  final Widget body;
  final bool isActive;
  final void Function(Widget sender)? onPressed;
  final Element _tabHead;
  late final Element _tabContent;
  bool _clicked = false;

  TabViewItem({required this.title, required this.body, this.isActive = false, this.onPressed}) : _tabHead = document.createElement("a") {
    _tabHead.classes.add("dawui-tabs__tab-head");
    if (isActive) {
      _tabHead.classes.add("dawui-tabs__tab-head--active");
    }
    _tabHead.onClick.listen((_) {
      onPressed?.call(this);
    });
    _tabHead.children.add(title.asHtmlElement());
  }

  @override
  Widget build() {
    _tabContent = DivElement();
    _tabContent.className = "dawui-tabs__tab-content${isActive ? "--active" : ""}";
    _tabContent.children.add(body.asHtmlElement());

    dawuiElement = _tabContent;
    return this;
  }
}
