import 'package:flutter/material.dart';
import 'package:flutterx/core/conversable.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';

class RemovePersonComponent implements IComponent<DetailsPageState, FloatingActionButton, void> {
  final DetailsPageState _screen;

  RemovePersonComponent(this._screen);

  final Conversable _conversable = Conversable();

  @override
  void init() {
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