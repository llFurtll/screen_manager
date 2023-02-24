import 'dart:collection';
import 'dart:developer';

import 'screen_receive.dart';

abstract class ScreenMediator {
  static final HashMap<String, ScreenReceive> _screens = HashMap();

  static void addScreen<T extends ScreenReceive>(String identify, T value) {
    if (!_screens.containsKey(identify)) {
      log("[SCREEN_MANAGER]: Added screen with identification: `$identify` for receiving calls");
      _screens[identify] = value;
    }
  }

  static void callScreen<T>(
    String identify,
    String message,
    dynamic value,
    {ScreenReceive? screen}
  ) {
    assert(_screens.containsKey(identify), "Screen not found");
    _screens[identify]!.receive(message, value, screen: screen);
  }

  static void removeScreen(String identify) {
    log("[SCREEN_MANAGER]: Removed screen with identification: $identify");
    _screens.removeWhere((key, value) => key == identify);
  }
}