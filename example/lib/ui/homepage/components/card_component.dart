import 'package:flutter/material.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';

import '../../../domain/implementations/entities/person.dart';
import '../../detailspage/detailspage.dart';
import '../homepage.dart';

class CardComponent implements IComponent<HomePageState, InkWell, void> {

  // ignore: prefer_final_fields
  Person _person;
  final HomePageState _screen;

  CardComponent(this._person, this._screen);

  @override
  void init() {
    return; 
  }

  @override
  void dispose() {
    return; 
  }

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