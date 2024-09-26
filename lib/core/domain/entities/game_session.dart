import 'dart:math';
import 'dart:ui';

import 'package:netology_practice/features/game/domain/entities/mouse.dart';

import 'package:hive/hive.dart';

part 'game_session.g.dart';

@HiveType(typeId: 0)
class GameSession extends HiveObject {
  @HiveField(0)
  List<Mouse> mice;

  @HiveField(1)
  int score;

  @HiveField(2)
  int totalClicks;

  @HiveField(3)
  DateTime startTime;

  @HiveField(4)
  Duration duration;

  GameSession({
    required this.mice,
    required this.startTime,
    this.score = 0,
    this.totalClicks = 0,
    this.duration = Duration.zero,
  });

  void addMouse(Mouse mouse) {
    mice.add(mouse);
  }

  void removeMouse(Mouse mouse) {
    mice.remove(mouse);
  }

  void incrementScore() {
    score++;
  }

  void incrementTotalClicks() {
    totalClicks++;
  }

  Offset generateRandomPosition(Size screenSize) {
    final random = Random();
    return Offset(
      random.nextDouble() * screenSize.width,
      random.nextDouble() * screenSize.height,
    );
  }

  void endSession() {
    duration = DateTime.now().difference(startTime);
  }
}
