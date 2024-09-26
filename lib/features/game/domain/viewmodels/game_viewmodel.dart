import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netology_practice/core/domain/entities/game_session.dart';
import 'package:netology_practice/core/domain/entities/game_settings.dart';
import 'package:netology_practice/features/game/domain/entities/mouse.dart';
import 'package:netology_practice/features/game/domain/utils/img_angle.dart';

class GameViewModel extends ChangeNotifier {
  final GameSession _gameSession;
  final Size _screenSize;
  late Timer _timer;

  GameViewModel({
    required GameSettings settings,
    required Size screenSize,
  })  : _gameSession = GameSession(mice: [], startTime: DateTime.now()),
        _screenSize = screenSize {
    _initializeMice(settings);
    _startMouseMovement();
  }

  GameSession get gameSession => _gameSession;

  void _initializeMice(GameSettings settings) {
    for (int i = 0; i < settings.miceAmount; i++) {
      _gameSession.addMouse(
        Mouse(
          size: settings.mouseSize.toDouble(),
          speed: settings.mouseSpeed.toDouble(),
          position: _gameSession.generateRandomPosition(_screenSize),
        ),
      );
    }
    notifyListeners();
  }

  void _startMouseMovement() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      for (var mouse in _gameSession.mice) {
        final newPosition = _gameSession.generateRandomPosition(_screenSize);
        updateMousePosition(mouse, newPosition);
      }
    });
  }

  void onMouseClick(Mouse mouse) {
    _gameSession.incrementScore();
    _gameSession.removeMouse(mouse);
    _gameSession.addMouse(
      Mouse(
        size: mouse.size,
        speed: mouse.speed,
        position: _gameSession.generateRandomPosition(_screenSize),
      ),
    );
    notifyListeners();
  }

  void onScreenClick() {
    _gameSession.incrementTotalClicks();
    notifyListeners();
  }

  void updateMousePosition(Mouse mouse, Offset newPosition) {
    final angle =
        ImageAngle.calculateRotationAngle(mouse.position, newPosition);
    mouse.moveTo(newPosition, angle);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
