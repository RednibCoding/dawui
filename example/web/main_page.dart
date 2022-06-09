import 'dart:html';
import 'package:dawui/dawui.dart';

class MainPage extends Widget {
  Observable<String> btnText1 = Observable("Button 1");
  Observable<String> btnTextA = Observable("A");

  @override
  void initState() {
    // You can initialize stuff at runtime here
    btnText1.value = "Button 1";
    btnTextA.value = "B";
  }

  @override
  Element build() => DivElement()
    ..className = "container"
    ..children.add(ColoredButton(text: "Button", onPressed: () => print("Button pressed")).context(this))
    ..children.add(
      row(
        children: [
          TextField(label: "Text here...").context(this),
          Observer(
            children: {
              btnText1: () =>
                  AccentButton(text: btnText1.value, onPressed: () => btnText1.value == "Button 1" ? btnText1.value = "Button 2" : btnText1.value = "Button 1")
                      .context(this),
              btnTextA: () =>
                  ColoredFabButton(text: btnTextA.value, onPressed: () => btnTextA.value == "A" ? btnTextA.value = "B" : btnTextA.value = "A").context(this),
            },
          ).context(this),
        ],
      ),
    );
}
