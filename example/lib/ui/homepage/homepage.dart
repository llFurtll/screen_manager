import 'package:flutter/material.dart';

import 'package:flutterx/core/flutterx_listenable_builder.dart';
import 'package:flutterx/core/flutterx_notifier_list.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:flutterx/domain/interfaces/conversable.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/homepage/components/card_component.dart';
import 'package:flutterx_example/ui/homepage/components/float_action_button_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements IScreen {
  late final FlutterXNotifierList<Person> _notifierList = FlutterXNotifierList<Person>([]);
  final Conversable _conversable = Conversable();

  @override
  void initState() {
    super.initState();
    _conversable.addScren("homepage", this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterXListenableBuilder(
        valueListenable: _notifierList,
        builder: (context, value, child) => ListView(
          children: [
            ..._notifierList.items.map((person) =>
              CardComponent(person, this).constructor())
          ],
        ),
      ),
      floatingActionButton: FloatActionButtonComponent(this).constructor(),
    );
  }

  FlutterXNotifierList<Person> getListCards() {
    return _notifierList;
  }

  @override
  void emitScreen(IComponent component) {
    component.event();
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    if (message == 'remove') {
      _notifierList.items.remove(value);
    }
  }
}