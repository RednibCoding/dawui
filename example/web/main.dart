import 'package:dawui/dawui.dart';

void main() {
  buildApp((Map<String, String> args) => MainApp(), theme: Theme());
}

final blaTheme = Theme(btnColorSecondary: "#123456");

class MainApp extends Widget {
  @override
  Widget build() {
    return Center(
      child: Container(
        width: "500px",
        child: TabView(
          tabViewItems: [
            TabViewItem(
              title: Text("Tab 1", style: TextStyle(color: "#00FF0C")),
              body: Text("Tab 1 content"),
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
        ),
      ),
    );
  }
}
