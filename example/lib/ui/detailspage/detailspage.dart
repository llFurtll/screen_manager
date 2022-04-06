import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String _name;
  final String _age;

  const DetailsPage(this._name, this._age, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $_name"),
            Text("Age: $_age"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}