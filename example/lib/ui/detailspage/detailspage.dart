import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/detailspage/components/remove_person_component.dart';


class DetailsPage extends StatefulWidget {
  final Person _person;

  const DetailsPage(this._person, {Key? key}) : super(key: key);
  
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> implements IScreen {

  late final RemovePersonComponent removePersonComponent;

  @override
  void initState() {
    removePersonComponent = RemovePersonComponent(this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._person.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${widget._person.name}"),
            Text("Age: ${widget._person.age}"),
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