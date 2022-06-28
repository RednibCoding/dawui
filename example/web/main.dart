import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final sliderValue = Observable("0");
  final slider = Slider(width: "250px");

  @override
  Widget build() {
    return Stack(children: [
      Row(children: [ColoredButton(child: Text("Hello 1")), ColoredButton(child: Text("Hello 2"))]),
      Row(children: [ColoredButton(child: Text("I am ontop"))]),
    ]);
  }
}
