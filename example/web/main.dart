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
          language: CodeAreaLanguage.html,
          width: "90%",
          height: "500px",
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
        ),
      ],
    );
  }
}
