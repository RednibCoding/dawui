import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final opacity = Observable("0.5");

  @override
  Widget build() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image("./assets/logo.png", width: "300px", height: "150px"),
    );
  }
}
