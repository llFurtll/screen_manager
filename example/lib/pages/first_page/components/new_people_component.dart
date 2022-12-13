import 'package:compmanager/screen_component.dart';
import 'package:flutter/material.dart';

import '../controller/first_page_controller.dart';

// ignore: must_be_immutable
class NewPeopleComponent extends ScreenComponent<FirstPageController> {
  NewPeopleComponent({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FloatingActionButton(
      onPressed: () => controller.createPeople(),
      child: const Icon(Icons.add),
    );
  }
}