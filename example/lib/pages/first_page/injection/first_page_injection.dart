import 'package:flutter/material.dart';
import 'package:compmanager/screen_injection.dart';

import '../controller/first_page_controller.dart';
import '../components/app_bar_component.dart';
import '../components/list_peoples_component.dart';
import '../components/new_people_component.dart';

// ignore: must_be_immutable
class FirstPageInjection extends ScreenInjection<FirstPageController> {
  FirstPageInjection({
    Key? key,
    required Builder child
  }) : super(
    key: key,
    child: child,
    controller: FirstPageController(),
    components: [
      AppBarComponent(),
      ListPeoplesComponent(),
      NewPeopleComponent()
    ]
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}