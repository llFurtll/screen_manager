import 'package:flutter/material.dart';

class GlobalDependencies extends InheritedWidget {
  final String hello = "Esse Hello é Global";

  const GlobalDependencies({
    super.key,
    required super.child
  });

  static GlobalDependencies of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<GlobalDependencies>();
    assert(result != null, "No injection found on context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}