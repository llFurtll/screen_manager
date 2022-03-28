import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx/infra/implementations/screen_default.dart';
class FloatingActionButtonComponent implements IComponent<DefaultScreen, FloatingActionButton, void> {

  FloatingActionButtonComponent();

  @override
  void afterEvent() {}

  @override
  void beforeEvent() {}

  @override
  FloatingActionButton constructor() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: callEvent,
    );
  }

  @override
  void event() {}

  @override
  void callEvent() {}
}