import 'package:compmanager/screen_controller.dart';
import 'package:compmanager/screen_receive.dart';
import 'package:flutter/material.dart';

import '../../second_page/view/second_page_view.dart';
import '../../../entities/people.dart';

class FirstPageController extends ScreenController {
  final List<People> peoples = [];

  void createPeople() {
    Navigator.of(context).pushNamed(SecondPage.secondPageRoute, arguments: null);
  }

  void updatePeople(People people) {
    Navigator.of(context).pushNamed(SecondPage.secondPageRoute, arguments: people);
  }

  void deletePeople(People people) {
    peoples.removeWhere((item) => item.id == people.id);
    refresh();
  }

  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    switch (message) {
      case "new_people":
        peoples.add(value);
        break;
      case "update_people":
        int position = peoples.indexWhere((people) => people.id == value.id);
        peoples[position] = value;
    }

    refresh();
  }
}