import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

class FloatingActionButtonComponent implements IComponent<HomePageState, FloatingActionButton, void> {

  final HomePageState screen;

  FloatingActionButtonComponent(this.screen);

  @override
  void afterEvent() {
    return;
  }

  @override
  void beforeEvent() {
    return;
  }

  @override
  FloatingActionButton constructor() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: callEvent,
    );
  }

  @override
  void event() {
    screen.getCount().value++;
  }

  @override
  void callEvent() {
    event();
  }
}