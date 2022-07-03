import 'package:dawui/dawui.dart';

void main() {
  buildApp((Map<String, String> args) => MainApp(), theme: Theme());
}

final blaTheme = Theme(btnColorSecondary: "#123456");

class MainApp extends Widget {
  final opacity = Observable("0.5");

  final codeArea = CodeArea(
    language: CodeAreaLanguage.dart,
    width: "90%",
    code: r'''
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="scaffolded-by" content="https://github.com/dart-lang/sdk">
    <title>dawui_example</title>
    <link rel="stylesheet" href="styles.css">
    <script defer src="main.dart.js"></script>
</head>

<body>
</body>
</html>''',
  );

  @override
  Widget build() {
    return Column(
      children: [
        PrimaryButton(
          child: Text("Default"),
          onPressed: (_) => CodeArea.setTheme(CodeAreaTheme.normal),
        ),
        PrimaryButton(
          child: Text("Dark"),
          onPressed: (_) => CodeArea.setTheme(CodeAreaTheme.dark),
        ),
        PrimaryButton(
          child: Text("Solarized Light"),
          onPressed: (_) => CodeArea.setTheme(CodeAreaTheme.soarizedLight),
        ),
        PrimaryButton(
          child: Text("Tomorrow Night"),
          onPressed: (_) => CodeArea.setTheme(CodeAreaTheme.tomorrowNight),
        ),
        PrimaryButton(
          child: Text("Language html"),
          onPressed: (_) => codeArea.setLanguage(CodeAreaLanguage.html),
        ),
        codeArea,
      ],
    );
  }
}
