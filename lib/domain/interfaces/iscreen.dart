import 'icomponent.dart';
import 'conversable.dart';

abstract class IScreen {
  void emitScreen(IComponent component) {
    component.event();
  }
}