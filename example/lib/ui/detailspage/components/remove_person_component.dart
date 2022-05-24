import 'package:flutter/material.dart';
import 'package:compmanager/core/conversable.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';

import '../detailspage.dart';

class RemovePersonComponent implements IComponent<DetailsPageState, FloatingActionButton, void> {
  final DetailsPageState _screen;

  RemovePersonComponent(this._screen);

  final Conversable _conversable = Conversable();

  @override
  void init() {
    return;
  }

  @override
  void dispose() {
    return;
  }

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
      child: const Icon(Icons.delete),
      onPressed: () {
        _screen.emitScreen(this);
      }
    );
  }

  @override
  void event() {
    _conversable.callScreen("homepage")!.receive("remove", _screen.getPerson());
    Navigator.pop(_screen.context);
  }
  
}