import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class PropertyValueNotifier<T> extends ValueNotifier<T> {
  T value;
  final List<T> _items;

  PropertyValueNotifier(this.value, this._items) : super(value);

  ObservedList<T> get items => ObservedList(_items, notifyListeners);

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
class ObservedList<T> with ListMixin<T> {
  final List<T> _list;
  final void Function() _modified;

  ObservedList(this._list, this._modified);

  @override
  int get length => _list.length;

  @override
  set length(final int value) {
    _list.length = value;
    _modified();
  }

  @override
  T operator [](final int index) {
    return _list[index];
  }

  @override
  void operator []=(final int index, final T value) {
    _list[index] = value;
    _modified();
  }

  @override
  void add(final T element) {
    _list.add(element);
    _modified();
  }

  @override
  void insert(final int index, final T element) {
    _list.insert(index, element);
    _modified();
  }

  @override
  bool remove(final Object? element) {
    final value = _list.remove(element);
    _modified();
    return value;
  }

  @override
  T removeAt(final int index) {
    final value = _list.removeAt(index);
    _modified();
    return value;
  }
}