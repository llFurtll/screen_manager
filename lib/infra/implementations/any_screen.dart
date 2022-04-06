import '../../domain/interfaces/icomponent.dart';
import '../../domain/interfaces/iscreen.dart';

class AnyScreen implements IScreen {
  @override
  void emitScreen(IComponent component) {
    return;
  }
}