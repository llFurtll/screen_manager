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
      child: ScreenParams<FirstPageController, FirstPageInjection>(
        child: FirstPageView(),
      )
    );
  }
}

// ignore: must_be_immutable
class FirstPageView extends ScreenView<FirstPageController, FirstPageInjection> {
  FirstPageView({Key? key}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBarWidget(context: context),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListPeoplesComponent(context: context),
      ),
      floatingActionButton: NewPeopleWidget(context: context),
    );
  }

  @override
  void receive(String message, value, {ScreenReceive? screen}) {
    controller.receive(message, value);
  }
}