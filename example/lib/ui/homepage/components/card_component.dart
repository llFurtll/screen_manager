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
  void afterEvent() {
    print("Vai abrir o Details...");
  }

  @override
  void beforeEvent() {
    print("Finalizou..");
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
              Text(title),
              Text(idade),
            ],
          ),
        ),
      ),
      onTap: () => screen.emitScreen(this),
    );
  }

  @override
  void event() {
    afterEvent();
    Navigator.of(screen.context).push(
      MaterialPageRoute(builder: (BuildContext context) => DetailsPage(title, idade)),
    );
    beforeEvent();
  }
}