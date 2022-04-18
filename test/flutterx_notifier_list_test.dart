import 'package:flutter_test/flutter_test.dart';
import 'package:flutterx/core/flutterx_notifier_list.dart';
void main() {
  late List<String?> tests;
  late FlutterXNotifierList<String?> notifierList;

  setUp(() {
    tests = ["Test"];
    notifierList = FlutterXNotifierList(tests);
  });

  group("Tests in FlutterXNotifierList", () {
    test("Test get value FlutterXNotififerList", () {
      List<String?> response = List.from(notifierList.value);
      expect(response, notifierList.value);
    });

    test("Length", () {
      List<String?> response = List.from(notifierList.value);
      expect(response.length, notifierList.value.length);
    });

    test("notify", () {
      expect(() => notifierList.notifyListeners(), returnsNormally);
    });

    test("Set Length", () {
      notifierList.value.length = 5;
      List<String?> response = List.from(notifierList.value);
      expect(response.length, notifierList.value.length, );
    });

    test("Add", () {
      List<String?> response = List.from(notifierList.value);
      response.add("Add");
      notifierList.value.add("Add");
      expect(response, notifierList.value);
    });

    test("Insert", () {
      List<String?> response = List.from(notifierList.value);
      response.insert(0, "Show");
      notifierList.value.insert(0, "Show");
      expect(response, notifierList.value);
    });

    test("Remove", () {
      List<String?> response = List.from(notifierList.value);
      response.remove("Show");
      notifierList.value.remove("Show");
      expect(response, notifierList.value);
    });

    test("RemoveAt", () {
      List<String?> response = List.from(notifierList.value);
      response.removeAt(0);
      notifierList.value.removeAt(0);
      expect(response, notifierList.value);
    });
  });
}