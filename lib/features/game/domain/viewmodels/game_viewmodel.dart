import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:netology_practice/core/domain/cache/hive_local_storage.dart';
import 'package:netology_practice/core/domain/entities/game_session.dart';
import 'package:netology_practice/core/domain/entities/game_settings.dart';
import 'package:netology_practice/features/game/domain/entities/mouse.dart';
import 'package:netology_practice/features/game/domain/utils/img_angle.dart';

class GameViewModel extends ChangeNotifier {
  final GameSession _gameSession;
  final Size _screenSize;
  late Timer _mouseMovementTimer;
  late Timer _sessionTimer;
  bool _isPaused = false;
  DateTime? _pauseStartTime;
  Duration _pausedDuration = Duration.zero;
  final List<String> _mouseImages = [
    'lib/core/assets/images/mouses/mouse1.png',
    'lib/core/assets/images/mouses/mouse2.png',
    'lib/core/assets/images/mouses/mouse3.png',
    'lib/core/assets/images/mouses/mouse4.png',
    'lib/core/assets/images/mouses/mouse5.png',
  ];

  GameViewModel({
    required GameSettings settings,
    required Size screenSize,
  })  : _gameSession = GameSession(mice: [], startTime: DateTime.now()),
        _screenSize = screenSize {
    _initializeMice(settings);
    _startMouseMovement();
    _startSessionTimer();
  }

  GameSession get gameSession => _gameSession;
  bool get isPaused => _isPaused;

  void _initializeMice(GameSettings settings) {
    _mouseImages.shuffle();
    for (int i = 0; i < settings.miceAmount; i++) {
      _gameSession.addMouse(
        Mouse(
          size: settings.mouseSize.toDouble(),
          speed: settings.mouseSpeed.toDouble(),
          position: _gameSession.generateRandomPosition(_screenSize),
          image: _mouseImages[i],
        ),
      );
    }
    notifyListeners();
  }

  void _startMouseMovement() {
    _mouseMovementTimer =
        Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!_isPaused) {
        for (var mouse in _gameSession.mice) {
          final newPosition = _gameSession.generateRandomPosition(_screenSize);
          updateMousePosition(mouse, newPosition);
        }
      }
    });
  }

  void _startSessionTimer() {
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        _gameSession.duration =
            DateTime.now().difference(_gameSession.startTime) - _pausedDuration;
        notifyListeners();
      }
    });
  }

  void onMouseClick(Mouse mouse) {
    if (!_isPaused) {
      _gameSession.incrementScore();
      _gameSession.removeMouse(mouse);
      _gameSession.addMouse(
        Mouse(
          size: mouse.size,
          speed: mouse.speed,
          position: _gameSession.generateRandomPosition(_screenSize),
          image: mouse.image,
        ),
      );
      notifyListeners();
    }
  }

  void onScreenClick() {
    if (!_isPaused) {
      _gameSession.incrementTotalClicks();
      notifyListeners();
    }
  }

  void updateMousePosition(Mouse mouse, Offset newPosition) {
    final angle =
        ImageAngle.calculateRotationAngle(mouse.position, newPosition);
    mouse.moveTo(newPosition, angle);
    notifyListeners();
  }

  void pauseGame() {
    _isPaused = true;
    _pauseStartTime = DateTime.now();
    notifyListeners();
  }

  void resumeGame() {
    if (_pauseStartTime != null) {
      _pausedDuration += DateTime.now().difference(_pauseStartTime!);
    }
    _isPaused = false;
    notifyListeners();
  }

  void endGame() {
    _mouseMovementTimer.cancel();
    _sessionTimer.cancel();
    _gameSession.endSession();
    _saveSession();
    notifyListeners();
  }

  Future<void> _saveSession() async {
    final box = await Hive.openBox(HiveLocalStorage.gameHistoryCache);
    try {
      if (box.length >= 10) {
        final oldestKey = box.keys.first;
        await box.delete(oldestKey);
      }
      await box.put(DateTime.now().toIso8601String(), _gameSession);
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }

  @override
  void dispose() {
    _mouseMovementTimer.cancel();
    _sessionTimer.cancel();
    super.dispose();
  }
}
