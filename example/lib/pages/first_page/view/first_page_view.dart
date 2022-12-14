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
      child: Builder(
        builder: (context) => FirstPageView(context: context),
      ),
    );
  }
}

// ignore: must_be_immutable
class FirstPageView extends ScreenView<FirstPageController, FirstPageInjection> implements ScreenReceive {
  ScreenMediator mediator = ScreenMediator();

  FirstPageView({Key? key, required BuildContext context}) : super(key: key, context: context) {
    mediator.addScren("firstpageview", this);
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBarComponent(context: context),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListPeoplesComponent(context: context),
      ),
      floatingActionButton: NewPeopleComponent(context: context),
    );
  }

  @override
  void receive(String message, value, {ScreenReceive? screen}) {
    controller.receive(message, value);
  }
}