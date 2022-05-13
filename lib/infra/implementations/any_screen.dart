import '../../domain/interfaces/icomponent.dart';
import '../../domain/interfaces/iscreen.dart';

class AnyScreen implements IScreen {
  @override
  List<IComponent> listComponents = [];

  @override
  void emitScreen(IComponent component) {
    return;
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    return;
  }

  @override
  IComponent getComponent(Type type) {
    return listComponents.firstWhere((element) => element.runtimeType == type);
  }

  @override
  void addComponent(IComponent component) {
    listComponents.add(component);
  }
}