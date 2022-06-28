import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final opacity = Observable("0.5");

  @override
  Widget build() {
    return Center(
      vertical: false,
      child: SizedBox(
        width: "100%",
        height: "100%",
        child: Stack(
          children: [
            TabView(
              tabViewItems: [
                TabViewItem(
                  isActive: true,
                  title: Text("Startseite"),
                  body: Text("Startseite"),
                ),
                TabViewItem(
                  title: Text("Inhalt"),
                  body: Text("Inhalt"),
                ),
                TabViewItem(
                  title: Text("Leserprobe"),
                  body: Text("Leserprobe"),
                ),
                TabViewItem(
                  title: Text("Kaufen"),
                  body: Text("Kaufen"),
                ),
                TabViewItem(
                  title: Text("Autor"),
                  body: Text("Autor"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
