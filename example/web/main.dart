import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final btnText1 = Observable("Button 1");
  final btnTextA = Observable("A");

  @override
  Widget build() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        btnText1.observe((_) =>
            ColoredButton(text: btnText1.value, onPressed: () => btnText1.value == "Button 1" ? btnText1.value = "Button 2" : btnText1.value = "Button 1")),
        btnTextA
            .observe((_) => ColoredActionButton(text: btnTextA.value, onPressed: () => btnTextA.value == "A" ? btnTextA.value = "B" : btnTextA.value = "A")),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(label: "Test 1", width: "100px"),
            ColoredButton(text: "Button 1", onPressed: () => print("Hello")),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            TextField(label: "Test 2"),
            ColoredButton(text: "Button 2"),
          ],
        ),
        Row(
          children: [
            TextField(label: "Test 3"),
            ColoredButton(text: "Button 3"),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: AccentButton(text: "Button 4", width: "100%"),
            ),
            Flexible(
              flex: 1,
              child: ColoredButton(text: "Button 5", width: "100%"),
            ),
            Flexible(
              flex: 3,
              child: AccentButton(text: "Button 6", width: "100%"),
            ),
          ],
        ),
      ],
    );
  }
}
