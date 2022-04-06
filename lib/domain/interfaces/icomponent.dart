import 'iscreen.dart';

abstract class IComponent<T extends IScreen, W, F> {
  IComponent(T? screen);

  W constructor();
  F beforeEvent();
  F event();
  F afterEvent();
}