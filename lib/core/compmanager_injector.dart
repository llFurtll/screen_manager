import 'dart:collection';

class CompManagerInjector {

  late HashMap<String, dynamic> _dependencies;

  static final CompManagerInjector _instance = CompManagerInjector._internal();

  factory CompManagerInjector() => _instance;

  CompManagerInjector._internal() {
    _dependencies = HashMap();
  }

  void registerDependencie<T>(T value) {
    assert(value != null);
    if (!_dependencies.containsValue(value)) {
      _dependencies["${value.hashCode}"] = value;
    }
  }

  T getDependencie<T>() {
    return _dependencies.values.firstWhere((element) => element is T);
  }
}