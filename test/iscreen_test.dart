import 'package:compmanager/domain/interfaces/icomponent.dart';
import 'package:compmanager/domain/interfaces/iscreen.dart';

import 'package:flutter_test/flutter_test.dart';

import 'component/icomponent_test.dart';

class ScreenTest implements IScreen {
  @override
  List<IComponent> listComponents = [];

  @override
  void addComponent(IComponent component) {
    listComponents.add(component);
  }

  @override
  void emitScreen(IComponent component) {
    return;
  }

  @override
  IComponent getComponent(Type type) {
    return listComponents.firstWhere((element) => element.runtimeType == type);
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    return;
  }

  @override
  Future<void> dependencies() async {
    return;
  }

}

void main() {
  late ScreenTest screen;
  late FakeComponent fakeComponent;

  setUp(() {
    screen = ScreenTest();
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

    test("dependencies", () {
      expect(() => screen.dependencies(), returnsNormally);
    });

    test("getComponent", () {
      screen.addComponent(fakeComponent);
      IComponent component = screen.getComponent(fakeComponent.runtimeType);
      assert(component == fakeComponent);
    });
  });
}