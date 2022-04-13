import 'package:flutter/material.dart';
import 'package:flutterx/core/conversable.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/components/modal_person_component.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';

class EditPersonComponent implements IComponent<DetailsPageState, AppBar, Future<bool>> {
  final DetailsPageState _screen;
  Person _person;

  EditPersonComponent(this._screen, this._person) {
    init();
  }
  
  final Conversable _conversable = Conversable();
  late final ModalPersonComponent<DetailsPageState> _modalPersonComponent;

  @override
  void init() {
    _modalPersonComponent = ModalPersonComponent(_screen, _person);
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
  AppBar constructor() {
    return AppBar(
      title: ValueListenableBuilder(
        valueListenable: _screen.getNotififier(),
        builder: (BuildContext context, Person person, Widget? widget) {
          return Text(_screen.getNotififier().value.name);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            _screen.emitScreen(this);
          },
        )
      ],
    );
  }

  @override
  Future<bool> event() async {
    if (await _modalPersonComponent.beforeEvent()) {
      _person = _modalPersonComponent.updatePerson();
      _conversable.callScreen("homepage")!.receive("update", _person);
      _conversable.callScreen("detailspage")!.receive("update", _person);
    }

    return false;
  }
}