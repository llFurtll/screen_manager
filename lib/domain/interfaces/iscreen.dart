import 'icomponent.dart';

abstract class IScreen {
  void emitScreen(IComponent component);

  void receive(String message, dynamic value, {IScreen? screen});
}