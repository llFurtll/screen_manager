import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

import '../injection/first_page_injection.dart';
import '../controller/first_page_controller.dart';

class FirstPage extends Screen {
  const FirstPage({Key? key}) : super(key: key);

  @override
  FirstPageInjection build(BuildContext context) {
    return FirstPageInjection(
      child: FirstPageView()
    );
  }
}

// ignore: must_be_immutable
class FirstPageView extends ScreenView<FirstPageController, FirstPageInjection> {
  FirstPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const Scaffold();
  }
}