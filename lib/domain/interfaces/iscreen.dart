import 'icomponent.dart';

abstract class IScreen {
  void emitScreen(IComponent component) {
    component.event();
  }

  void receive(String message, dynamic value, {IScreen? screen}) {
    return;
  }
}