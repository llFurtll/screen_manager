import 'package:compmanager/screen_mediator.dart';
import 'package:compmanager/screen_receive.dart';
import 'package:compmanager/screen_view.dart';
import 'package:flutter/material.dart';

import '../injection/first_page_injection.dart';
import '../controller/first_page_controller.dart';
import '../components/app_bar_component.dart';
import '../components/list_peoples_component.dart';
import '../components/new_people_component.dart';

class FirstPage extends Screen {
  static const firsPageRoute = "/";

  const FirstPage({Key? key}) : super(key: key);

  @override
  FirstPageInjection build(BuildContext context) {
    return FirstPageInjection(
      child: FirstPageView()
    );
  }
}

// ignore: must_be_immutable
class FirstPageView extends ScreenView<FirstPageController, FirstPageInjection> implements ScreenReceive {
  ScreenMediator mediator = ScreenMediator();

  FirstPageView({Key? key}) : super(key: key) {
    mediator.addScren("firstpageview", this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: getComponent(AppBarComponent).build(context) as PreferredSize,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: getComponent(ListPeoplesComponent),
      ),
      floatingActionButton: getComponent(NewPeopleComponent),
    );
  }

  @override
  void receive(String message, value, {ScreenReceive? screen}) {
    controller.receive(message, value);
  }
}