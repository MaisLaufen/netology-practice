abstract class ILocalStorage {
  Future<void> save({
    required String key,
    required dynamic value,
    String? boxName,
  });

  Future<dynamic> load({
    required String key,
    String? boxName,
  });

  Future<void> delete({
    required String key,
    String? boxName,
  });

  Future<List<dynamic>> loadAll({String? boxName});

  Future<void> saveAll({
    required Map<String, dynamic> values,
    String? boxName,
  });
}
