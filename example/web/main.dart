import 'package:dawui/dawui.dart';

void main() {
  buildApp((Map<String, String> args) => MainApp(), theme: Theme());
}

final blaTheme = Theme(btnColorSecondary: "#123456");

class MainApp extends Widget {
  @override
  Widget build() {
    return TabView(
      tabViewItems: [
        TabViewItem(
          title: Text("Tab 1"),
          body: TabView(
            onPressed: (sender) => print(((sender as TabViewItem).title as Text).value),
            tabViewItems: [
              TabViewItem(
                title: Text("Tab 1.1"),
                body: Text("Tab 1.1 content"),
                isActive: true,
              ),
              TabViewItem(
                title: Text("Tab 1.2"),
                body: Text("Tab 1.2 content"),
              ),
              TabViewItem(
                title: Text("Tab 1.3"),
                body: Text("Tab 1.3 content"),
              ),
            ],
          ),
          isActive: true,
        ),
        TabViewItem(
          title: Text("Tab 2"),
          body: Text("Tab 2 content"),
        ),
        TabViewItem(
          title: Text("Tab 3"),
          body: Text("Tab 3 content"),
        ),
      ],
    );
  }
}
