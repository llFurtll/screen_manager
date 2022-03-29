import 'package:flutter/material.dart';
import 'package:flutterx/domain/interfaces/icomponent.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

class CardComponent implements IComponent<HomePageState, InkWell, void> {

  String title;
  String idade;
  HomePageState screen;

  CardComponent(this.title, this.idade, this.screen);

  @override
  void afterEvent() {}

  @override
  void beforeEvent() {}

  @override
  InkWell constructor() {
    return InkWell(
      child: SizedBox(
        height: 150.0,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text(idade),
            ],
          ),
        ),
      ),
      onTap: callEvent,
    );
  }

  @override
  void event() {
    Navigator.of(screen.context).push(
      MaterialPageRoute(builder: (BuildContext context) => DetailsPage(title, idade)),
    );
  }

  @override
  void callEvent() {
    event();
    screen.refreshScreen();
  }
}