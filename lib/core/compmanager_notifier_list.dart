import 'dart:collection';
import 'package:flutter/foundation.dart';

class CompManagerNotifierList<T> extends ChangeNotifier implements ValueListenable<List<T>> {
  final List<T> _list;

  CompManagerNotifierList(this._list);
   
  @override
  List<T> get value => CompManagerObservedList(_list, notifyListeners);
}

class CompManagerObservedList<T> extends ListBase<T> {
  final List<T> _list;
  final void Function() _notify;

  CompManagerObservedList(this._list, this._notify);

  @override
  int get length => _list.length;

  @override
  set length(final int value) {
    _list.length = value;
    _notify();
  }

  @override
  T operator [](final int index) {
    return _list[index];
  }

  @override
  void operator []=(final int index, final T value) {
    _list[index] = value;
    _notify();
  }

  @override
  void add(final T element) {
    _list.add(element);
    _notify();
  }

  @override
  void insert(final int index, final T element) {
    _list.insert(index, element);
    _notify();
  }

  @override
  bool remove(final Object? element) {
    final value = _list.remove(element);
    _notify();
    return value;
  }

  @override
  T removeAt(final int index) {
    final value = _list.removeAt(index);
    _notify();
    return value;
  }
}