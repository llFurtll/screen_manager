import 'package:compmanager/screen_controller.dart';
import 'package:compmanager/screen_injection.dart';
import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

import 'pages/first_page/view/first_page_view.dart';
import 'pages/second_page/view/second_page_view.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: "/",
    home: Teste(),
    // routes: {
    //   FirstPage.firsPageRoute: (context) => const FirstPage(),
    //   SecondPage.secondPageRoute:(context) => const SecondPage()
    // },
  ));
}

// ignore: must_be_immutable
class Teste extends ScreenView<NoController, NoScreenInjection> {
  Teste({super.key});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}