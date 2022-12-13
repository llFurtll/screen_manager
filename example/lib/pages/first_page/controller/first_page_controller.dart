import 'package:compmanager/screen_controller.dart';
import 'package:compmanager/screen_receive.dart';
import 'package:flutter/material.dart';

import '../../second_page/view/second_page_view.dart';
import '../../../entities/people.dart';

class FirstPageController extends ScreenController {
  final ValueNotifier<List<People>> peoples = ValueNotifier([]);

  void createPeople() {
    Navigator.of(context).pushNamed(SecondPage.secondPageRoute, arguments: null);
  }

  void updatePeople(People people) {
    Navigator.of(context).pushNamed(SecondPage.secondPageRoute, arguments: people);
  }

  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    switch (message) {
      case "new_people":
        peoples.value.add(value);
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        peoples.notifyListeners();
        break;
      case "update_people":
        int position = peoples.value.indexWhere((people) => people.id == value.id);
        peoples.value[position] = value;
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        peoples.notifyListeners();
    }
  }
}