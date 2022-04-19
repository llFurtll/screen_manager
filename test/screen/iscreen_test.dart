import 'package:flutter_test/flutter_test.dart';

import '../component/icomponent_test.dart';
import 'package:flutterx/infra/implementations/any_screen.dart';

void main() {
  late AnyScreen screen;
  late FakeComponent fakeComponent;

  setUp(() {
    screen = AnyScreen();
    fakeComponent = FakeComponent();
  });

  group("Tests methods abstract class IScreen", () {
    test("emitScreen", () {
      expect(() => screen.emitScreen(fakeComponent), returnsNormally);
    });

    test("receive", () {
      expect(() => screen.receive("test", 0), returnsNormally);
    });
  });
}