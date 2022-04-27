import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterx_example/ui/detailspage/detailspage.dart';
import 'package:flutterx_example/ui/homepage/homepage.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
void main() {
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  Widget constructorWidget({Widget? child}) {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockNavigatorObserver],
    );
  }

  testWidgets("Check features on the homepage", (WidgetTester tester) async {
    await tester.pumpWidget(constructorWidget(child: const HomePage()));

    final floatAction = find.byType(FloatingActionButton);

    /**
     * 1° Check that the FloatActionButton was created correctly and that it doesn't have any cards.
     */
    expect(floatAction, findsOneWidget);

    /**
     * 2° Check if list is empty
     */
    expect(find.byType(Card), findsNothing);

    await tester.tap(floatAction);
    await tester.pump();

    /**
     * 3° Check that clickng the FloatActionButton displays the Dialog.
     */
    expect(find.byType(Dialog), findsOneWidget);

    /**
     * 4° Insert texts in the form
     */
    await tester.enterText(find.byKey(const ValueKey('textName')), "Daniel");
    await tester.enterText(find.byKey(const ValueKey('textAge')), "22");

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

    /**
     * 8° Go to another screen
     */
    await tester.tap(find.byType(Card));

    // verify(mockNavigatorObserver.didPush(any, any));

    // expect(find.byType(DetailsPage), findsOneWidget);
  });
}