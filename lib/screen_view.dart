import 'package:flutter/material.dart';

import 'screen_controller.dart';
import 'screen_injection.dart';
import 'screen_manager_controller.dart';
import 'screen_mediator.dart';
import 'screen_receive.dart';

abstract class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenInjection build(BuildContext context);
}

class ScreenParams<C extends ScreenController, I extends ScreenInjection<C>> extends StatelessWidget {
  final Widget child;

  const ScreenParams({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    C? controller = ScreenManagerController.getDependencie();
    
    if (controller == null) {
      controller = ScreenInjection.of<I>(context).controller;
      controller.context = context;
      ScreenManagerController.registerDependencie(controller);
    } else {
      controller.context = context;
    }
    
    return SizedBox(
      child: child,
    );
  }
}

// ignore: must_be_immutable
abstract class ScreenView<T extends ScreenController, I extends ScreenInjection<T>> extends StatefulWidget {
  ScreenReceiveArgs? _receiveArgs;
  late Function refresh;

  ScreenView({Key? key}) : super(key: key);

  T get controller => ScreenManagerController.getDependencie()!;

  @override
  State<StatefulWidget> createState() => _ScreenViewState<I>();

  @mustCallSuper
  Scaffold build(BuildContext context);

  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    return;
  }
}

class _ScreenViewState<I extends ScreenInjection> extends State<ScreenView> with ScreenReceive {
  ScreenMediator mediator = ScreenMediator();

  @override
  void initState() {
    super.initState();
    widget.controller.onInit();
    widget._receiveArgs = ScreenInjection.of<I>(widget.controller.context).receiveArgs;
    if (widget._receiveArgs != null && widget._receiveArgs!.receive) {
      mediator.addScreen(widget._receiveArgs!.identity, this);
    }
  }

  @override
  void dispose() {
    widget.controller.onClose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    widget.refresh = () => setState(() {});

    widget.controller.refresh = widget.refresh;
    widget.controller.context = context;
    widget.controller.onDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return widget.build(context);
  }

  @override
  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    widget.receive(message, value, screen: screen);
  }
}