import 'package:compmanager/screen_controller.dart';
import 'package:flutter/material.dart';

import '../../second_page/view/second_page_view.dart';
import '../../../entities/people.dart';

class FirstPageController extends ScreenController {
  final ValueNotifier<List<People>> peoples = ValueNotifier([]);

  void createPeople() {
    Navigator.of(context).pushNamed(SecondPage.secondPageRoute, arguments: null);
  }
}