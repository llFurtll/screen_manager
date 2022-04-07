import 'dart:collection';

import 'iscreen.dart';

class Conversable {
  late HashMap<String, IScreen> _screens;

  static final Conversable _instance = Conversable._internal();

  factory Conversable() => _instance;

  Conversable._internal() {
    _screens = HashMap();
  }

  void addScren<T extends IScreen>(String identify, T value) {
    if (!_screens.containsValue(value)) {
      _screens[identify] = value;
    }
  }

  IScreen? callScreen<T>(String identify) {
    return _screens[identify];
  }
}