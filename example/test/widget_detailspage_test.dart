import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterx_example/domain/implementations/entities/person.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';

void main() {
  Widget constructorWidget({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("Check features on the detailspage", (WidgetTester tester) async {
    Person person = Person(name: "Daniel", age: "22");

    await tester.pumpWidget(constructorWidget(child: DetailsPage(person)));

    /**
     * 1° Verify that the screen components were built correctly
     */
    final appBar = find.byType(AppBar);
    final floatAction = find.byType(FloatingActionButton);
    final btnEdit = find.byIcon(Icons.edit);

    expect(appBar, findsOneWidget);
    expect(floatAction, findsOneWidget);
    expect(btnEdit, findsOneWidget);

    /**
     * 2° Check if the dialog opened
     */
    await tester.tap(btnEdit);
    await tester.pump();

    expect(find.byType(Dialog), findsOneWidget);

    /**
     * 3° Check if the text form field contains already filled values
     */
    TextFormField name = tester.widget<TextFormField>(find.byKey(const ValueKey('textName')));
    TextFormField age = tester.widget<TextFormField>(find.byKey(const ValueKey('textAge')));

    expect(name.controller!.text, person.name);
    expect(age.controller!.text, person.age);

    /**
     * 4° Insert new texts in the form
     */
    await tester.enterText(find.byKey(const ValueKey('textName')), "Daniel M");
    await tester.enterText(find.byKey(const ValueKey('textAge')), "23");

    /**
     * 5° Find button responsible for update the person.
     */
    final btnSave = find.byKey(const ValueKey('buttonSave'));
    await tester.tap(btnSave);
    await tester.pump();

    /**
     * 6° Check if dialog it's closed.
     */
    expect(find.byType(Dialog), findsNothing);

    /**
     * 7° Check if the person has updated the data
     */
    expect(person.name, "Daniel M");
    expect(person.age, "23");
  });
}