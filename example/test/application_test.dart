import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:compmanager_example/domain/implementations/entities/person.dart';
import 'package:compmanager_example/ui/homepage/homepage.dart';
import 'package:compmanager_example/ui/detailspage/detailspage.dart';

void main() {
  Widget constructorWidget({Widget? child}) {
    return MaterialApp(
      home: child
    );
  }

  testWidgets("Check features on homepage and detail page", (WidgetTester tester) async {
    Person person = Person(name: "Daniel", age: "22");
    
    await tester.pumpWidget(constructorWidget(child: const HomePage()));

    final floatAction = find.byType(FloatingActionButton);

    /**
     * 1° Check that the FloatActionButton was created correctly
     */
    expect(floatAction, findsOneWidget);

    /**
     * 2° Check if list is empty
     */
    expect(find.byType(Card), findsNothing);

    /**
     * 3° Check that clickng the FloatActionButton displays the Dialog.
     */
    await tester.tap(floatAction);
    await tester.pump();
    
    expect(find.byType(Dialog), findsOneWidget);

    /**
     * 4° Insert texts in the form
     */
    await tester.enterText(find.byKey(const ValueKey('textName')), person.name);
    await tester.enterText(find.byKey(const ValueKey('textAge')), person.age);

    /**
     * 5° Find button responsible for creating the person.
     */
    final btnSave = find.byKey(const ValueKey('buttonSave'));
    await tester.tap(btnSave);
    await tester.pump();

    /**
     * 6° Check if dialog it's closed.
     */
    expect(find.byType(Dialog), findsNothing);

    /**
     * 7° Checks if a card has been added to the list
     */
    expect(find.byType(Card), findsOneWidget);
    expect(find.text(person.name), findsOneWidget);
    expect(find.text(person.age), findsOneWidget);

    /**
     * 8° Go to another screen
     */
    await tester.tap(find.byType(Card));
    await tester.pumpAndSettle();

    /**
     * 9° Check if you went to another screen
     */
    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(DetailsPage), findsOneWidget);
    
    /**
     * 10° Verify that the screen components were built correctly
     */
    final appBar = find.byType(AppBar);
    final floatActionRemove = find.byType(FloatingActionButton);
    final btnEdit = find.byIcon(Icons.edit);

    expect(appBar, findsOneWidget);
    expect(floatActionRemove, findsOneWidget);
    expect(btnEdit, findsOneWidget);

    /**
     * 11° Check if the dialog opened
     */
    await tester.tap(btnEdit);
    await tester.pump();

    expect(find.byType(Dialog), findsOneWidget);

    /**
     * 12° Check if the text form field contains already filled values
     */
    TextFormField name = tester.widget<TextFormField>(find.byKey(const ValueKey('textName')));
    TextFormField age = tester.widget<TextFormField>(find.byKey(const ValueKey('textAge')));

    expect(name.controller!.text, person.name);
    expect(age.controller!.text, person.age);

    person.name = "Daniel M";
    person.age = "23";

    /**
     * 13° Insert new texts in the form
     */
    await tester.enterText(find.byKey(const ValueKey('textName')), person.name);
    await tester.enterText(find.byKey(const ValueKey('textAge')), person.age);

    /**
     * 14° Find button responsible for update the person.
     */
    final btnUpdate = find.byKey(const ValueKey('buttonSave'));
    await tester.tap(btnUpdate);
    await tester.pump();

    /**
     * 15° Check if dialog it's closed.
     */
    expect(find.byType(Dialog), findsNothing);

    /**
     * 16° Check if the person has updated the data
     */
    expect(find.text(person.name), findsOneWidget);
    expect(find.text(person.age, skipOffstage: false), findsOneWidget);

    /**
     * 15° Tap button responsible for remove the person.
     */
    await tester.tap(floatActionRemove);
    await tester.pumpAndSettle();

    /**
     * 16° Check if you went to another screen
     */
    expect(find.byType(DetailsPage), findsNothing);
    expect(find.byType(HomePage), findsOneWidget);

    /**
     * 17° Check if the person has remove the data in HomePage
     */
    expect(find.text(person.name), findsNothing);
    expect(find.text(person.age), findsNothing);
  });
}