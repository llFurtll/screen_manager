import 'package:flutter/foundation.dart';

class FlutterXNotifier<T> extends ChangeNotifier implements ValueListenable<T> {
  T _value;

  FlutterXNotifier(this._value);
   
  @override
  T get value => _value;

  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }
}