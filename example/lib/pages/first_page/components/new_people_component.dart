import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

// ignore: must_be_immutable
class NewPeopleComponent extends ScreenComponent<FirstPageController, FloatingActionButton> {
  NewPeopleComponent({Key? key}) : super(key: key);
  
  @override
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => controller.createPeople(),
      child: const Icon(Icons.add),
    );
  }
}