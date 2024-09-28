import 'package:netology_practice/core/domain/cache/hive_local_storage.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  ServiceLocator._internal();

  final Map<Type, dynamic> _services = {};

  void register<T>(T service) {
    _services[T] = service;
  }

  T get<T>() {
    return _services[T] as T;
  }
}

// DI во VM для сохранения сессий
// Лучше конечно использовать get_it, но это сложнее
void setupServiceLocator() {
  final serviceLocator = ServiceLocator();
  serviceLocator.register<HiveLocalStorage>(HiveLocalStorage());
}
