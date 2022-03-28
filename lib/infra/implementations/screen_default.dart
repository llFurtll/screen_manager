import '../../domain/interfaces/icomponent.dart';
import '../../domain/interfaces/iscreen.dart';

mixin DefaultScreen implements IScreen {
  @override
  void refreshScreen(IComponent component) {
    return;
  }
}