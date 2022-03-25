import 'dart:collection';

class FlutterXInjector {

  late HashMap<String, dynamic> _dependencies;

  static final FlutterXInjector _instance = FlutterXInjector._internal();

  factory FlutterXInjector() => _instance;

  FlutterXInjector._internal() {
    _dependencies = HashMap();
  }

  void registerDependencie<T>(T value) {
    if (!_dependencies.containsValue(value)) {
      assert(value != null);
      _dependencies["${value.hashCode}"] = value;
    }
  }

  T getDependencie<T>() {
    return _dependencies.values.firstWhere((element) => element is T);
  }
}