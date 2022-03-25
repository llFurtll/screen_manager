import 'iscreen.dart';

abstract class IComponent<T extends IScreen, W, F> {
  final T screen;

  IComponent(this.screen);

  W constructor();
  F beforeEvent();
  F event();
  F afterEvent();
  F finalizeEvent();
}