import 'package:flutter/material.dart';

import 'core/dependencies/global_dependencies.dart';
import 'pages/first_page/view/first_page_view.dart';
import 'pages/second_page/view/second_page_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GlobalDependencies(
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          FirstPage.firstPageRoute: (context) => const FirstPage(),
          SecondPage.secondPageRoute:(context) => const SecondPage()
        },
      )
    )
  );
}