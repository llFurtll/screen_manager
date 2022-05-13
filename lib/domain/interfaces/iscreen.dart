import 'icomponent.dart';

abstract class IScreen {
  List<IComponent> listComponents = [];

  void emitScreen(IComponent component);

  void receive(String message, dynamic value, {IScreen? screen});

  void addComponent(IComponent component);

  IComponent getComponent(Type type);
}