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

class ScreenBridge<C extends ScreenController, I extends ScreenInjection<C>> extends StatelessWidget {
  final Widget child;

  const ScreenBridge({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    C? controller = ScreenManagerController.getController();
    
    if (controller == null) {
      controller = ScreenInjection.of<I>(context).controller;
      controller.receiveArgs = ScreenInjection.of<I>(context).receiveArgs;
      controller.context = context;
      ScreenManagerController.registerController(controller);
    } else {
      controller.context = context;
    }
    
    return child;
  }
}

abstract class ScreenView<C extends ScreenController> extends StatefulWidget {
  const ScreenView({Key? key}) : super(key: key);

  C get controller {
    C? item = ScreenManagerController.getController();
    assert(item != null, "Controller has not been difined");
    return item!;
  }

  @override
  State<StatefulWidget> createState() => _ScreenViewState();

  @mustCallSuper
  Scaffold build(BuildContext context);

  void receive(String message, dynamic value, {ScreenReceive? screen}) {
    return;
  }
}

class _ScreenViewState extends State<ScreenView> with ScreenReceive {
  @override
  void initState() {
    super.initState();
    widget.controller.onInit();
    if (widget.controller.receiveArgs.receive) {
      ScreenMediator.addScreen(widget.controller.receiveArgs.identity, this);
    }
  }

  @override
  void dispose() {
    if (widget.controller.receiveArgs.receive) {
      ScreenMediator.removeScreen(widget.controller.receiveArgs.identity); 
    }
    widget.controller.onClose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.controller.refresh = () => setState(() {});
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