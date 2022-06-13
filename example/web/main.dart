import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  @override
  Widget build() {
    return Column(
      children: [
        Row(children: [
          TabView(
            tabViewItems: [
              TabViewItem(title: Badge("1", Text("Hello 1")), body: Center(child: Text("Hello 1"))),
              TabViewItem(title: Badge("2", Text("Hello 2")), body: Center(child: Text("Hello 2")), isActive: true),
              TabViewItem(title: Badge("3", Text("Hello 3")), body: Center(child: Text("Hello 3"))),
            ],
          ),
          TabView(
            tabViewItems: [
              TabViewItem(title: Badge("1", Text("World 1")), body: Center(child: Text("World 1"))),
              TabViewItem(title: Badge("2", Text("World 2")), body: Center(child: Text("World 2"))),
              TabViewItem(title: Badge("3", Text("World 3")), body: Center(child: Text("World 3")), isActive: true),
            ],
          ),
        ]),
      ],
    );
  }
}
