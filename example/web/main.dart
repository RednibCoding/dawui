import 'package:dawui/dawui.dart';

void main() {
  buildApp((Map<String, String> args) => MainApp(), theme: Theme());
}

final blaTheme = Theme(btnColorSecondary: "#123456");

class MainApp extends Widget {
  @override
  Widget build() {
    return NavbarScrollableTabs(
      title: Text("Hello World"),
      navbarTabItems: [
        NavbarTabItem(
          title: Text("Tab 1"),
          content: Text("Content 1"),
          isActive: true,
        ),
        NavbarTabItem(
          title: Text("Tab 2"),
          content: Text("Content 2"),
        ),
        NavbarTabItem(
          title: Text("Tab 3"),
          content: Text("Content 3"),
        ),
      ],
    );
  }
}
