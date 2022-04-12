import 'package:flutter/material.dart';
import 'package:flutterx/core/conversable.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/detailspage/components/edit_person_component.dart';
import 'package:flutterx_example/ui/detailspage/components/remove_person_component.dart';


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
  late final EditPersonComponent editPerson;
  final Conversable _conversable = Conversable();

  @override
  void initState() {
    removePersonComponent = RemovePersonComponent(this);
    editPerson = EditPersonComponent(this, getPerson());
    _conversable.addScren("detailspage", this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: editPerson.constructor(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${getPerson().name}"),
            Text("Age: ${getPerson().age}"),
          ],
        ),
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
    return;
  }
}