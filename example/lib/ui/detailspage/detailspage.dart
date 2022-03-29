import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String idade;

  const DetailsPage(this.title, this.idade, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title: $title"),
            Text("Idade: $idade"),
          ],
        ),
      ),
    );
  }
}