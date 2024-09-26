import 'dart:math';
import 'dart:ui';

import 'package:netology_practice/features/game/domain/entities/mouse.dart';

class GameSession {
  List<Mouse> mice;
  int score;
  int totalClicks;

  GameSession({
    required this.mice,
    this.score = 0,
    this.totalClicks = 0,
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
}
