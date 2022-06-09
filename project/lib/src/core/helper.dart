import 'dart:math';

String makeUid() {
  return "${genRandomHash(8)}-${DateTime.now().millisecondsSinceEpoch}";
}

String genRandomHash(int length) {
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  final hash = String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  return hash;
}
