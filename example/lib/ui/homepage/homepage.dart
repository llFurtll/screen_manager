import 'package:flutter/material.dart';

import 'package:flutterx/core/flutterx_listenable_builder.dart';
import 'package:flutterx/core/flutterx_notifier.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:flutterx_example/ui/homepage/components/float_action_button_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with IScreen {
  final FlutterXNotifier<List<Widget>> _listaCards = FlutterXNotifier([]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterXListenableBuilder(
        valueListenable: _listaCards,
        builder: (context, value, child) => ListView(
          children: _listaCards.value,
        ),
      ),
      floatingActionButton: FloatActionButtonComponent(this).constructor(),
    );
  }

  FlutterXNotifier<List<Widget>> getListCards() {
    return _listaCards;
  }
}