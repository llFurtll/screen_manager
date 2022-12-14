import 'package:compmanager/screen_injection.dart';
import 'package:flutter/material.dart';

import '../controller/second_page_controller.dart';
import '../components/app_bar_component.dart';
import '../components/save_people_component.dart';

// ignore: must_be_immutable
class SecondPageInjection extends ScreenInjection<SecondPageController> {
  SecondPageInjection({
    Key? key,
    required Builder child
  }) : super(
    key: key,
    child: child,
    controller: SecondPageController(),
    components: [
      AppBarComponent(),
      SavePeopleComponent()
    ]
  );
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}