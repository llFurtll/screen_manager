import 'dart:collection';

import 'screen_receive.dart';

class ScreenMediator {
  late HashMap<String, ScreenReceive> _screens;

  static final ScreenMediator _instance = ScreenMediator._internal();

  factory ScreenMediator() => _instance;

  ScreenMediator._internal() {
    _screens = HashMap();
  }

  void addScreen<T extends ScreenReceive>(String identify, T value) {
    if (!_screens.containsValue(value)) {
      _screens[identify] = value;
    }
  }

  ScreenReceive? callScreen<T>(String identify) {
    assert(_screens.containsKey(identify), "Screen not found");
    return _screens[identify];
  }
}