import 'dart:collection';

import 'screen_receive.dart';

class Conversable {
  late HashMap<String, ScreenReceive> _screens;

  static final Conversable _instance = Conversable._internal();

  factory Conversable() => _instance;

  Conversable._internal() {
    _screens = HashMap();
  }

  void addScren<T extends ScreenReceive>(String identify, T value) {
    if (!_screens.containsValue(value)) {
      _screens[identify] = value;
    }
  }

  ScreenReceive? callScreen<T>(String identify) {
    return _screens[identify];
  }
}