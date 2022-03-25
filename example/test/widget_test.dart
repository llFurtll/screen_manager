import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';

void main() {

  Widget constructorHomePage({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("HomePage has a count and FloatActionButtonComponent", (WidgetTester tester) async {
    await tester.pumpWidget(constructorHomePage(child: const HomePage()));

    final countValueNotifier = find.text('0');
    final floatAction = find.widgetWithIcon(FloatingActionButton, Icons.add);
    
    expect(countValueNotifier, findsOneWidget);
    expect(floatAction, findsOneWidget);
  });

  testWidgets("HomePage increment count value when clicked in floatingActionButton", (WidgetTester tester) async {
    await tester.pumpWidget(constructorHomePage(child: const HomePage()));
    await tester.tap(find.byType(FloatingActionButton));

    expect(find.text('1'), findsOneWidget);
  });
}