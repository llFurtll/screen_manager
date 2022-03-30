import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

import 'card_component.dart';

class FloatActionButtonComponent extends IComponent<HomePageState, FloatingActionButton, void> {

  HomePageState screen;

  FloatActionButtonComponent(this.screen) : super(screen);

  @override
  void afterEvent() {
    print("Irá atualizar a lista...");
  }

  @override
  void beforeEvent() {
    print("A lista foi atualizada...");
  }

  @override
  FloatingActionButton constructor() {
    return FloatingActionButton(
      onPressed: () => screen.emitScreen(this),
      child: const Icon(Icons.add),
    );
  }

  @override
  void event() {
    screen.getListCards().addItem(
      CardComponent("25", "15", screen).constructor()
    );
  }
  
}