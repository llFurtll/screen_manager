import 'package:flutter/material.dart';
import 'package:compmanager/core/conversable.dart';
import 'package:compmanager/domain/interfaces/iscreen.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';

import '../../domain/implementations/entities/person.dart';
import 'components/edit_person_component.dart';
import 'components/remove_person_component.dart';


// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  // ignore: prefer_final_fields
  Person _person;

  DetailsPage(this._person, {Key? key}) : super(key: key);
  
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> implements IScreen {

  late final RemovePersonComponent removePersonComponent;
  late final EditPersonComponent editPersonComponent;
  final Conversable _conversable = Conversable();
  late final ValueNotifier<Person> _notifierPerson;

  @override
  void initState() {
    removePersonComponent = RemovePersonComponent(this);
    editPersonComponent = EditPersonComponent(this, widget._person);
    _conversable.addScren("detailspage", this);
    _notifierPerson = ValueNotifier(widget._person);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: editPersonComponent.constructor(),
      body: ValueListenableBuilder(
        valueListenable: _notifierPerson,
        builder: (BuildContext context, Person value, Widget? widget) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ${_notifierPerson.value.name}"),
                Text("Age: ${_notifierPerson.value.age}"),
              ],
            ),
          );
        },
      ),
      floatingActionButton: removePersonComponent.constructor(),
    );
  }

  Person getPerson() {
    return widget._person;
  }

  @override
  void emitScreen(IComponent component) {
    component.event();
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    switch (message) {
      case 'update':
        Person _newPerson = Person(name: value.name, age: value.age);
        _notifierPerson.value = _newPerson;
    }
  }

  ValueNotifier<Person> getNotififier() {
    return _notifierPerson;
  }
}