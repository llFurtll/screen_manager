import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';
import '../injection/first_page_injection.dart';

// ignore: must_be_immutable
class NewPeopleComponent extends ScreenComponent<FirstPageController, FirstPageInjection> {
  NewPeopleComponent({Key? key, required BuildContext context}) : super(key: key, context: context);
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => controller.createPeople(),
      child: const Icon(Icons.add),
    );
  }
}