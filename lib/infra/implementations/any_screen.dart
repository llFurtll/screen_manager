import 'package:flutter/material.dart';

import '../../domain/interfaces/icomponent.dart';
import '../../domain/interfaces/iscreen.dart';

class AnyScreen implements IScreen {
  @override
  void emitScreen(IComponent component) {
    return;
  }

  @override
  void receive(String message, value, {IScreen? screen}) {
    return;
  }
}