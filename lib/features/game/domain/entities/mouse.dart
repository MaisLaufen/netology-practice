import 'dart:ui';

class Mouse {
  double size;
  double speed;
  Offset position;

  Mouse({
    required this.size,
    required this.speed,
    required this.position,
  });

  void moveTo(Offset newPosition) {
    position = newPosition;
  }
}
