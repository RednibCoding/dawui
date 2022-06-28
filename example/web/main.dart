import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final opacity = Observable("0.5");

  @override
  Widget build() {
    return Scaffold(children: [
      Container(
        width: "100%",
        height: "100%",
        child: Center(
          child: Container(
              width: "150px",
              height: "150px",
              child: SingleChildScrollView(
                child: Text(
                    "You can use the overflow property when you want to have better control of the layout. The overflow property specifies what happens if content overflows an element's box."),
              )),
        ),
      ),
      Container(
        width: "100%",
        height: "350px",
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Image("./assets/logo.png", width: "300px", height: "150px"),
        ),
      ),
    ]);
  }
}
