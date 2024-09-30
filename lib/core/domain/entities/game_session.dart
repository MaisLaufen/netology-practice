import 'dart:math';
import 'dart:ui';

import 'package:netology_practice/features/game/domain/entities/mouse.dart';

import 'package:hive/hive.dart';

part 'game_session.g.dart';

@HiveType(typeId: 0)
class GameSession extends HiveObject {
  @HiveField(0)
  int miceAmount;

  @HiveField(1)
  int score;

  @HiveField(2)
  int totalClicks;

  @HiveField(3)
  DateTime startTime;

  @HiveField(4)
  Duration duration;

  List<Mouse> mice;

  GameSession(
      {required this.mice,
      required this.startTime,
      this.score = 0,
      this.totalClicks = 0,
      this.duration = Duration.zero,
      this.miceAmount = 0}); // =! 1

  void addMouse(Mouse mouse) {
    mice.add(mouse);
    miceAmount++;
  }

  void removeMouse(Mouse mouse) {
    mice.remove(mouse);
    miceAmount--;
  }

  void incrementScore() {
    score++;
  }

  void incrementTotalClicks() {
    totalClicks++;
  }

  final _random = Random();

  Offset generateRandomPosition(Size screenSize) {
    return Offset(
      _random.nextDouble() * screenSize.width,
      _random.nextDouble() * screenSize.height,
    );
  }

  void endSession() {
    duration = DateTime.now().difference(startTime);
  }
}
