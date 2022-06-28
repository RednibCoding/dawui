import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  @override
  Widget build() {
    return Stack(children: [
      Image("./assets/logo.png", width: "100%", height: "20%", onPressed: (sender) => (print((sender as Image).source))),
      Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ColoredButton(child: Text("Hello 1")),
          ColoredButton(child: Text("Hello 2")),
        ]),
        Text(
          "Dawui is awesome!",
          style: TextStyle(
            fontSize: "20px",
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: "#9B69FF",
            shadow: TextShadow(offsetX: "1px", offsetY: "1px"),
          ),
        ),
      ]),
    ]);
  }
}
