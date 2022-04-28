import 'package:flutter/material.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';

import '../../../domain/implementations/entities/person.dart';
import '../../components/modal_person_component.dart';
import '../homepage.dart';

class AddPersonComponent implements IComponent<HomePageState, FloatingActionButton, Future<bool>> {
  final HomePageState _screen;
  
  AddPersonComponent(this._screen) {
    init();
  }
  
  late final ModalPersonComponent<HomePageState> _modalPersonComponent;

  @override
  void init() {
    _modalPersonComponent = ModalPersonComponent(_screen);
    return;
  }

  @override
  Future<bool> afterEvent() async {
    return false;
  }

  @override
  Future<bool> beforeEvent() async {
    return false;
  }

  @override
  FloatingActionButton constructor() {
    return FloatingActionButton(
      onPressed: () => _screen.emitScreen(this),
      child: const Icon(Icons.add),
    );
  }

  @override
  Future<bool> event() async {
    if (await _modalPersonComponent.beforeEvent()) {
      Person person = _modalPersonComponent.createPerson();
      _screen.getListCards().value.add(person);
    }

    _modalPersonComponent.afterEvent();

    return false;
  }
}