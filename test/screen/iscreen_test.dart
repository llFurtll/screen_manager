import 'package:flutter_test/flutter_test.dart';
import 'package:flutterx/domain/interfaces/iscreen.dart';
import 'package:mockito/mockito.dart';

import '../component/icomponent_test.dart';
import '../component/icomponent_test.mocks.dart';

class FakeScreen extends Mock implements IScreen {}

void main() {
  late FakeScreen fakeScreen;
  late FakeComponent fakeComponent;

  setUp(() {
    fakeScreen = FakeScreen();
    fakeComponent = MockFakeComponent();
  });

  group("Tests methods abstract class IScreen", () {
    test("emitScreen", () {
      expect(() => fakeScreen.emitScreen(fakeComponent), returnsNormally);
      verify(fakeScreen.emitScreen(fakeComponent)).called(1);
    });

    test("receive", () {
      expect(() => fakeScreen.receive("test", 0), returnsNormally);
      verify(fakeScreen.receive("test", 0)).called(1);
    });
  });
}