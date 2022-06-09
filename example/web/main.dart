import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final btnText1 = Observable("Button 1");
  final btnTextA = Observable("A");
  var textField = TextField(label: "Hello", value: "World", onChange: (sender) => print((sender as TextField).value));
  var button1 = ColoredButton(child: Text("Hii"), onPressed: (sender) => (sender as ColoredButton).width = "100%");
  var awesomeButton = ColoredButton(
      height: "120px",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("X"),
          SizedBox(width: "8px"),
          Text("Hii"),
        ],
      ),
      onPressed: (sender) => (sender as ColoredButton).width = "100%");
  @override
  Widget build() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        awesomeButton,
        button1,
        textField,
        ColoredButton(child: Text("Textfield"), onPressed: (_) => textField.value = "Pennor"),
        btnText1.observe((_) => ColoredButton(
            child: Text(btnText1.value), onPressed: (_) => btnText1.value == "Button 1" ? btnText1.value = "Button 2" : btnText1.value = "Button 1")),
        btnTextA.observe(
            (_) => ColoredActionButton(child: Text(btnTextA.value), onPressed: (_) => btnTextA.value == "A" ? btnTextA.value = "B" : btnTextA.value = "A")),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            TextField(label: "Test 2"),
            ColoredButton(child: Text("Button 2")),
          ],
        ),
        Row(
          children: [
            TextField(label: "Test 3"),
            ColoredButton(child: Text("Button 3")),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: AccentButton(child: Text("Button 4"), width: "100%"),
            ),
            Flexible(
              flex: 1,
              child: ColoredButton(child: Text("Button 5"), width: "100%"),
            ),
            Flexible(
              flex: 3,
              child: AccentButton(child: Text("Button 6"), width: "100%"),
            ),
          ],
        ),
      ],
    );
  }
}
