import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

class CardComponent implements IComponent<HomePageState, InkWell, void> {

  // ignore: prefer_final_fields
  Person _person;
  final HomePageState _screen;

  CardComponent(this._person, this._screen);

  @override
  void afterEvent() {
  }

  @override
  void beforeEvent() {  
  }

  @override
  InkWell constructor() {
    return InkWell(
      child: SizedBox(
        height: 150.0,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_person.name),
              Text(_person.age),
            ],
          ),
        ),
      ),
      onTap: () => _screen.emitScreen(this),
    );
  }

  @override
  void event() {
    Navigator.of(_screen.context).push(
      MaterialPageRoute(builder: (BuildContext context) => DetailsPage(_person)),
    );
  }
}