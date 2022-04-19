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
      expect(notifierList.value, response);
    });

    test("Length", () {
      int response = notifierList.value.length;
      expect(notifierList.value.length, response);
    });

    test("notify", () {
      expect(() => notifierList.notifyListeners(), returnsNormally);
    });

    test("Set Length", () {
      notifierList.value.length = 5;
      List<String?> response = List.from(notifierList.value);
      expect(notifierList.value.length, response.length);
    });

    test("Test get element using operator", () {
      String response = "Test";
      expect(notifierList.value[0], response);
    });

    test("Test set element using operator", () {
      notifierList.value.length = 5;
      String response = "New Test";
      notifierList.value[1] = response;
      expect(notifierList.value[1], response);
    });

    test("Add", () {
      List<String?> response = List.from(notifierList.value);
      response.add("Add");
      notifierList.value.add("Add");
      expect(notifierList.value, response);
    });

    test("Insert", () {
      List<String?> response = List.from(notifierList.value);
      response.insert(0, "Show");
      notifierList.value.insert(0, "Show");
      expect(notifierList.value, response);
    });

    test("Remove", () {
      List<String?> response = List.from(notifierList.value);
      response.remove("Show");
      notifierList.value.remove("Show");
      expect(notifierList.value, response);
    });

    test("RemoveAt", () {
      List<String?> response = List.from(notifierList.value);
      response.removeAt(0);
      notifierList.value.removeAt(0);
      expect(notifierList.value, response);
    });
  });
}