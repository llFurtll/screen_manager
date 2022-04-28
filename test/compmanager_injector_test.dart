import 'package:flutter_test/flutter_test.dart';
import 'package:compmanager/core/compmanager_injector.dart';

class ExampleDataSource {}

class ExampleRepository {
  ExampleRepository(ExampleDataSource dataSource);
}

void main() {
  late final CompManagerInjector injector;

  group(
    "Testing CompManagerInjector",
    () {
      injector = CompManagerInjector();

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
