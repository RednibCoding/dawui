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

import 'observable.dart';
import 'widget.dart';

class Router extends Widget {
  final Widget Function(String) routeBuilder;
  late final Observable<String> currentRoute;

  Router({
    required this.routeBuilder,
    String? initialRoute,
  }) : currentRoute = Observable<String>(initialRoute ?? window.location.hash.replaceFirst('#', '')) {
    window.onHashChange.listen(_onHashChangeListener);
  }

  void _onHashChangeListener(_) {
    final route = window.location.hash.replaceFirst("#", "");
    if (route != currentRoute.value) push(route);
  }

  void push(String route) => currentRoute.value = route;

  @override
  Widget build() {
    window.location.hash = currentRoute.value;
    return currentRoute.observe(
      (currentRoute) => routeBuilder(currentRoute),
    );
  }
}