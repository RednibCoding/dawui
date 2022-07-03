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
        CodeArea(
          language: CodeAreaLanguage.dart,
          width: "350px",
          height: "200px",
          code: r'''final opacity = Observable("""0.5""");''',
        ),
      ],
    );
  }
}
