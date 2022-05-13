import 'package:flutter/material.dart';

import 'package:compmanager/core/compmanager_notifier_list.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';
import 'package:compmanager/domain/interfaces/iscreen.dart';
import 'package:compmanager/core/conversable.dart';

import '../../domain/implementations/entities/person.dart';
import 'components/add_person_component.dart';
import 'components/card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements IScreen {
  @override
  List<IComponent<IScreen, dynamic, dynamic>> listComponents = [];

  final CompManagerNotifierList<Person> _notifierList = CompManagerNotifierList<Person>([]);
  final Conversable _conversable = Conversable();

  @override
  void initState() {
    super.initState();
    _conversable.addScren("homepage", this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _notifierList,
        builder: (context, value, child) => ListView(
          key: const Key('listHome'),
          children: [
            ..._notifierList.value.map((_person) =>
              CardComponent(_person, this).constructor())
          ],
        ),
      ),
      floatingActionButton: AddPersonComponent(this).constructor(),
    );
  }

  CompManagerNotifierList<Person> getListCards() {
    return _notifierList;
  }

  @override
  void emitScreen(IComponent component) {
    component.event();
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    switch (message) {
      case 'remove':
        _notifierList.value.remove(value);
        break;
      case 'update':
        Person _person = value;
        int index = _notifierList.value.indexOf(_person);
        _notifierList.value[index] = _person;
    }
  }

  @override
  void addComponent(IComponent component) {
    listComponents.add(component);
  }

  @override
  IComponent getComponent(IComponent component) {
    return listComponents.firstWhere((element) => element == component);
  }
}