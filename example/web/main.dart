import 'package:dawui/dawui.dart';

void main() {
  buildApp((Map<String, String> args) => MainApp(), theme: Theme());
}

final blaTheme = Theme(btnColorSecondary: "#123456");

class MainApp extends Widget {
  final opacity = Observable("0.5");

  @override
  Widget build() {
    return Column(
      children: [
        TextArea(
          value: "Hello World",
          width: "200px",
          height: "200px",
          resize: TextareaResize.none,
          maxLength: 4,
          // autofocus: true,
        ),
        SizedBox(height: "10px"),
        TextField(
          value: "Hello World",
          maxLength: 4,
          autofocus: true,
        ),
      ],
    );
  }
}
