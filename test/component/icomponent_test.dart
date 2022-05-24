import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:compmanager/domain/interfaces/icomponent.dart';
import 'package:compmanager/infra/implementations/any_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'icomponent_test.mocks.dart';

class FakeComponent extends Mock implements IComponent<AnyScreen, Container, int> {}

@GenerateMocks([FakeComponent])
void main() {
  late FakeComponent fakeComponent;

  setUp(() {
    fakeComponent = MockFakeComponent();
  });

  group("Tests methods abstract class IComponent", () {
    test("init", () {
      expect(() => fakeComponent.init(), returnsNormally);
      verify(fakeComponent.init()).called(1);
    });

    test("dispose", () {
      expect(() => fakeComponent.dispose(), returnsNormally);
      verify(fakeComponent.dispose()).called(1);
    });

    test("constructor", () {
      when(fakeComponent.constructor()).thenReturn(Container());
      expect(fakeComponent.constructor(), isInstanceOf());
      verify(fakeComponent.constructor()).called(1);
    });

    test("beforeEvent", () {
      when(fakeComponent.beforeEvent()).thenReturn(1);
      expect(fakeComponent.beforeEvent(), 1);
      verify(fakeComponent.beforeEvent()).called(1);
    });

    test("event", () {
      when(fakeComponent.event()).thenReturn(2);
      expect(fakeComponent.event(), 2);
      verify(fakeComponent.event()).called(1);
    });

    test("afterEvent", () {
      when(fakeComponent.afterEvent()).thenReturn(3);
      expect(fakeComponent.afterEvent(), 3);
      verify(fakeComponent.afterEvent()).called(1);
    });
  });
}