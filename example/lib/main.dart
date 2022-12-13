import 'package:flutter/material.dart';

import 'pages/first_page/view/first_page_view.dart';
import 'pages/second_page/view/second_page_view.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      FirstPage.firsPageRoute: (context) => const FirstPage(),
      SecondPage.secondPageRoute:(context) => const SecondPage()
    },
  ));
}