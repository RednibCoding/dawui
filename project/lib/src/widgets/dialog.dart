import 'package:dawui/dawui.dart';

void showDialog(Widget content) {
  modalContent.children.clear();
  final htmlContent = content.asHtmlElement();
  modalContent.children.add(htmlContent);
  modalContainer.style.display = "block";
}

void closeDialog() {
  modalContainer.style.display = "none";
}
