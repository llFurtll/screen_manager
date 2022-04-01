import 'package:flutter/material.dart';

import 'package:flutterx/core/flutterx_listenable_builder.dart';
import 'package:flutterx/core/flutterx_notifier_list.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:flutterx_example/ui/homepage/components/float_action_button_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with IScreen {
  late final FlutterXNotifierList<Widget> _notifierList;

  @override
  void initState() {
    super.initState();
    _notifierList = FlutterXNotifierList<Widget>([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterXListenableBuilder(
        valueListenable: _notifierList,
        builder: (context, value, child) => ListView(
          children: _notifierList.items,
        ),
      ),
      floatingActionButton: FloatActionButtonComponent(this).constructor(),
    );
  }

  FlutterXNotifierList<Widget> getListCards() {
    return _notifierList;
  }
}