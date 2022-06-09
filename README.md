# dawui
Simple dart web ui framework inspired by flutter

## Example
```dart
import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final counter = Observable(0);

  @override
  Widget build() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Both work the same
        counter.observe((_) => Text("Counter: ${counter.value}")),
        counter.observe((value) => Text("Counter: $value")),
        SizedBox(height: "8px"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredButton(
              child: counter.observe((value) => Text("Clicked $value times")),
              onPressed: (Widget sender) {
                counter.value += 1;
              },
            ),
          ],
        ),
        SizedBox(height: "16px"),
        Container(
          width: "80%",
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: AccentButton(child: Text("Flexible 1"), width: "100%"),
              ),
              Flexible(
                flex: 1,
                child: ColoredButton(child: Text("Flexible 2"), width: "100%"),
              ),
              Flexible(
                flex: 2,
                child: AccentButton(child: Text("Flexible 3"), width: "100%"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

```

![example.png](./readme/example1.png)

## to be continued
