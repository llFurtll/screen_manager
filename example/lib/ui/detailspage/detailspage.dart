import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/conversable.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';

class DetailsPage extends StatelessWidget {
  final Person _person;

  final Conversable _conversable = Conversable();

  DetailsPage(this._person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${_person.name}"),
            Text("Age: ${_person.age}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _conversable.callScreen("homepage")!.receive("remove", _person);
          Navigator.pop(context);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}