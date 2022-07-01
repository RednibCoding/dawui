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
        FlatButton(
          child: Text("Flat Button"),
          onPressed: (_) => Dialog.show(
            Container(
              borderRadius: "10px",
              width: "400px",
              height: "300px",
              backgroundColor: "white",
              child: Center(
                child: Text("Hello World!"),
              ),
            ),
          ),
        ),
        PrimaryButton(
          child: Text("Primary Button"),
          onPressed: (_) => {blaTheme.apply()},
        ),
        SecondaryButton(child: Text("Secondary Button")),
        AccentButton(child: Text("Accent Button")),
        FlatActionButton(child: Text("FAB")),
        PrimaryActionButton(child: Text("PAB")),
        SecondaryActionButton(child: Text("SAB")),
        AccentActionButton(child: Text("AAB")),
      ],
    );
  }
}
