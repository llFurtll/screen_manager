import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

class CardComponent implements IComponent<HomePageState, InkWell, void> {

  final String _name;
  final String _age;
  HomePageState screen;

  CardComponent(this._name, this._age, this.screen);

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
              Text(_name),
              Text(_age),
            ],
          ),
        ),
      ),
      onTap: () => screen.emitScreen(this),
    );
  }

  @override
  void event() {
    Navigator.of(screen.context).push(
      MaterialPageRoute(builder: (BuildContext context) => DetailsPage(_name, _age)),
    );
  }
}