import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef FlutterXWidgetBuilder<T> = Widget Function(BuildContext context, T value, Widget? child);

class FlutterXListenableBuilder<T> extends StatefulWidget {
  final ValueListenable<T> valueListenable;
  final FlutterXWidgetBuilder<T> builder;
  final Widget? child;

  const FlutterXListenableBuilder({
    Key? key,
    required this.valueListenable,
    required this.builder,
    this.child,
  }) : assert(valueListenable != null),
       assert(builder != null),
       super(key: key);
  
  @override
  State<StatefulWidget> createState() => FlutterXListenableBuilderState<T>();
}

class FlutterXListenableBuilderState<T> extends State<FlutterXListenableBuilder<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.valueListenable.value;
    widget.valueListenable.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(FlutterXListenableBuilder<T> oldWidget) {
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(_valueChanged);
      value = widget.valueListenable.value;
      widget.valueListenable.addListener(_valueChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    setState(() { value = widget.valueListenable.value; });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value, widget.child);
  }
}