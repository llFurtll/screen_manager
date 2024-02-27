import 'package:screen_manager/extensions.dart';
import 'package:screen_manager/screen_widget.dart';
import 'package:flutter/material.dart';

import '../../../entities/people.dart';
import '../controller/second_page_controller.dart';


// ignore: must_be_immutable
class AppBarWidget extends ScreenWidget<SecondPageController> {
  AppBarWidget({Key? key}) : super(key: key);

  late String title;

  @override
  void onInit() {
    super.onInit();
    
    final people = controller.context.params<People>();

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