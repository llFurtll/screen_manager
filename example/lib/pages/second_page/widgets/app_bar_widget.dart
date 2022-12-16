import 'package:compmanager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../../../entities/people.dart';
import '../controller/second_page_controller.dart';
import '../injection/second_page_injection.dart';

// ignore: must_be_immutable
class AppBarWidget extends ScreenWidget<SecondPageController, SecondPageInjection> {
  AppBarWidget({Key? key, required BuildContext context}) : super(key: key, context: context);

  late String title;

  @override
  void onInit() {
    super.onInit();
    
    final people = ModalRoute.of(controller.context)!.settings.arguments as People?;

    if (people != null) {
      title = people.nome;
    } else {
      title = "New people";
    }
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return  AppBar(
      title: Text(title),
    );
  }
}