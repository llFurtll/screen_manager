import 'package:flutter_test/flutter_test.dart';
import 'package:flutterx/core/flutterx_injector.dart';

class ExampleDataSource {}

class ExampleRepository {
  ExampleRepository(ExampleDataSource dataSource);
}

void main() {
  late final FlutterXInjector injector;

  group(
    "Testing FlutterXInjector",
    () {
      injector = FlutterXInjector();

      test('registerDependencie', () {
        expect(() => injector.registerDependencie(ExampleDataSource()), returnsNormally);
        expect(() => injector.registerDependencie(ExampleRepository(ExampleDataSource())), returnsNormally);
      });

      test('getDependencie', () {
        expect(injector.getDependencie<ExampleDataSource>(), isInstanceOf<ExampleDataSource>());
        expect(injector.getDependencie<ExampleRepository>(), isInstanceOf<ExampleRepository>());
      });
    }
  );
}
