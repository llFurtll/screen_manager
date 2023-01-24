import 'package:compmanager/screen_receive.dart';
import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

import '../injection/first_page_injection.dart';
import '../controller/first_page_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/list_peoples_widget.dart';
import '../widgets/new_people_widget.dart';

class FirstPage extends Screen {
  static const firsPageRoute = "/";

  const FirstPage({Key? key}) : super(key: key);

  @override
  FirstPageInjection build(BuildContext context) {
    return FirstPageInjection(
      child: const ScreenBridge<FirstPageController, FirstPageInjection>(
        child: FirstPageView(),
      )
    );
  }
}

class FirstPageView extends ScreenView<FirstPageController> {
  const FirstPageView({Key? key}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBarWidget(),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListPeoplesComponent(context: context),
      ),
      floatingActionButton: const NewPeopleWidget(),
    );
  }

  @override
  void receive(String message, value, {ScreenReceive? screen}) {
    controller.receive(message, value);
  }
}