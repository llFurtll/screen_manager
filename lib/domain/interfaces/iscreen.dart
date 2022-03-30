import 'icomponent.dart';

mixin IScreen {
  void emitScreen(IComponent component) {
    component.event();
  }
}