import 'package:flutter/foundation.dart';

class FlutterXNotifier<T> extends ChangeNotifier implements ValueListenable<T> {
  T _someValue;
  int ifListSize = 0;

  FlutterXNotifier(this._someValue);

  set value(T value) {
    _someValue = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  void addItem<R>(R value) {
    (_someValue as List).add(value);
    notifyListeners();
  }

  @override
  T get value => _someValue;
}