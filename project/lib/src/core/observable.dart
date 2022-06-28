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

import 'widget.dart';

class Observable<T> {
  T _observable;
  T get value => _observable;
  bool get hasListener => _subscriptions.isNotEmpty;
  final Set<_Subscription<T>> _subscriptions = {};

  Observable(T initialValue) : _observable = initialValue;

  set value(T value) {
    _observable = value;
    final subs = {..._subscriptions};
    for (final sub in subs) {
      if (sub.widget.dawuiElement == null) {
        print("removing subscription from widget with null dawuiElement (this should never happen)");
        _subscriptions.remove(sub);
        continue;
      }
      if (sub.widget.dawuiElement!.isConnected != true) {
        print("removing subscription from widget with disconnected element");
        _subscriptions.remove(sub);
        continue;
      }

      final newElement = sub.builder(value).asHtmlElement();
      sub.widget.dawuiElement!.replaceWith(newElement);
      sub.widget.dawuiElement = newElement;
    }
  }

  Widget observe(Widget Function(T value) builder) {
    final widget = builder(_observable);
    _subscriptions.add(_Subscription<T>(widget, builder));
    return widget;
  }
}

class _Subscription<T> {
  Widget widget;
  final Widget Function(T value) builder;
  _Subscription(this.widget, this.builder);
}
