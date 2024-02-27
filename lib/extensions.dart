import 'package:flutter/material.dart';
import 'package:screen_manager/screen_injection.dart';

extension ScreenContext on BuildContext {
  I injection<I extends ScreenInjection>() => ScreenInjection.of(this);
  T get<I extends ScreenInjection, T>() {
    final screenInject = injection<I>();
    final T attribute = screenInject.attributes.whereType<T>().first;
    return attribute;
  }
  T? params<T>() => ModalRoute.of(this)?.settings.arguments as T?;
}