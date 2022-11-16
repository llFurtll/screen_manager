import 'iscreen.dart';

abstract class IComponent<T extends IScreen, W, F> {
  void init();
  void dispose();
  void bindings();
  W constructor();
  F beforeEvent();
  F event();
  F afterEvent();
}