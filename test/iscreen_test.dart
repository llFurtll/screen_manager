import 'package:compmanager/domain/interfaces/icomponent.dart';
import 'package:compmanager/infra/implementations/any_screen.dart';

import 'package:flutter_test/flutter_test.dart';

import 'component/icomponent_test.dart';

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

    test("addComponent", () {
      expect(() => screen.addComponent(fakeComponent), returnsNormally);
    });

    test("getComponent", () {
      screen.addComponent(fakeComponent);
      IComponent component = screen.getComponent(fakeComponent);
      assert(component == fakeComponent);
    });
  });
}