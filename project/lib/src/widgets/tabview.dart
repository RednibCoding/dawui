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

    dawuiElement = div;
    return this;
  }
}
