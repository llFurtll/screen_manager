import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

import 'card_component.dart';

class FloatActionButtonComponent extends IComponent<HomePageState, FloatingActionButton, void> {

  HomePageState screen;

  FloatActionButtonComponent(this.screen) : super(screen);

  @override
  void afterEvent() {
    return;
  }

  @override
  void beforeEvent() {
    return;
  }

  @override
  void callEvent() {
    event();
  }

  @override
  FloatingActionButton constructor() {
    return FloatingActionButton(
      onPressed: callEvent,
      child: const Icon(Icons.add),
    );
  }

  @override
  void event() {
    screen.getListaCards().value.add(
      CardComponent("Teste", "25", screen).constructor()
    );
  }
  
}