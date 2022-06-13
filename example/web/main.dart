import 'package:dawui/dawui.dart';

void main() {
  runApp((Map<String, String> args) => MainApp());
}

class MainApp extends Widget {
  final sliderValue = Observable("0");
  final slider = Slider(width: "250px");

  @override
  Widget build() {
    return Column(
      children: [
        Row(children: [
          TabView(
            tabViewItems: [
              TabViewItem(title: Badge("1", Text("Hello 1")), body: Center(child: Chip("Hello 1"))),
              TabViewItem(title: Badge("2", Text("Hello 2")), body: Center(child: Chip("Hello 2", isContact: true, avatarText: "H")), isActive: true),
              TabViewItem(title: Badge("3", Text("Hello 3")), body: Center(child: Chip("Hello 3", isButton: true))),
            ],
          ),
          TabView(
            tabViewItems: [
              TabViewItem(title: Badge("1", Text("World 1")), body: Center(child: Chip("World 1", isContact: true, deleteble: true))),
              TabViewItem(
                  title: Badge("2", Text("World 2")),
                  body: Center(child: Chip("World 2", deleteble: true, onDelete: (sender) => print((sender as Chip).label)))),
              TabViewItem(title: Badge("3", Text("World 3")), body: Center(child: Chip("World 3", isButton: true, isContact: true)), isActive: true),
            ],
          ),
        ]),
        SizedBox(height: "20px"),
        LoadingIndicator(),
        SizedBox(height: "20px"),
        LoadingIndicator(width: "500px"),
        SizedBox(height: "20px"),
        LoadingIndicator(isSpinner: true),
        SizedBox(height: "20px"),
        LoadingIndicator(isSpinner: true, spinnerMulticolor: true),
        SizedBox(height: "20px"),
        Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.baseline, children: [
          sliderValue.observe((value) => Text("Slider value: $value")),
          SizedBox(width: "20px"),
          slider..onChange = (value) => sliderValue.value = value,
        ]),
        SizedBox(height: "20px"),
      ],
    );
  }
}
