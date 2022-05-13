import 'package:flutter_test/flutter_test.dart';
import 'package:compmanager/core/conversable.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';
import 'package:compmanager/domain/interfaces/iscreen.dart';

class HomePageState implements IScreen {
  @override
  List<IComponent<IScreen, dynamic, dynamic>> listComponents = [];

  @override
  void emitScreen(IComponent<IScreen, dynamic, dynamic> component) {
    return;
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    return;
  }

  @override
  void addComponent(IComponent<IScreen, dynamic, dynamic> component) {
    return;
  }

  @override
  IComponent getComponent(Type type) {
    return listComponents.firstWhere((element) => element.runtimeType == type.runtimeType);
  }
}

void main() {
  late final Conversable conversable;

  group(
    "Testing Conversable", 
    () {
      conversable = Conversable();

      test("addScreen", () {
        expect(() => conversable.addScren("homepage", HomePageState()), returnsNormally);
      });

      test("callScreen", () {
        expect(conversable.callScreen("homepage"), isInstanceOf<IScreen>());
      });
    }
  );
}