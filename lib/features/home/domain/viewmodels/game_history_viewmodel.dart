import 'package:flutter/material.dart';
import 'package:netology_practice/core/domain/cache/hive_local_storage.dart';
import 'package:netology_practice/core/domain/entities/game_session.dart';

class GameHistoryViewmodel extends ChangeNotifier {
  final HiveLocalStorage localStorage;
  List<GameSession> _sessions = [];
  List<GameSession> get sessions => _sessions;

  GameHistoryViewmodel(this.localStorage);

  Future<void> loadSessions() async {
    final sessions =
        await localStorage.loadAll(boxName: HiveLocalStorage.gameHistoryCache);
    _sessions = sessions.cast<GameSession>();
    notifyListeners();
  }

  Future<void> addSession(GameSession session) async {
    await localStorage.save(
      key: DateTime.now().toIso8601String(),
      value: session,
      boxName: HiveLocalStorage.gameHistoryCache,
    );
    await loadSessions();
  }
}
