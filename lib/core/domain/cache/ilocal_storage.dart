import 'package:hive/hive.dart';
import 'package:netology_practice/core/domain/cache/hive_local_storage.dart';

class HiveLocalStorage implements ILocalStorage {
  // Boxes:
  static const String gameHistoryCache = 'gameHistory';

  /// Save one entity into a device local storage.
  @override
  Future<void> save({
    required String key,
    required dynamic value,
    String? boxName,
  }) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      await box.put(key, value);
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }

  /// Load one entity from a device local storage.
  @override
  Future<dynamic> load({
    required String key,
    String? boxName,
  }) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      final result = await box.get(key);
      return result;
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }

  /// Delete one entity from a device local storage.
  @override
  Future<void> delete({
    required String key,
    String? boxName,
  }) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      await box.delete(key);
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }

  /// Load all entites from device local storage.
  @override
  Future<List<dynamic>> loadAll({String? boxName}) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      return box.values.toList();
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }

  /// Save all entities into a device local storage.
  @override
  Future<void> saveAll({
    required Map<String, dynamic> values,
    String? boxName,
  }) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      await box.putAll(values);
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }
}
