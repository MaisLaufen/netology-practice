import 'dart:ui';

class Mouse {
  double size;
  double speed;
  Offset position;
  double angle;

  Mouse({
    required this.size,
    required this.speed,
    required this.position,
    this.angle = 0.0,
  });

  void moveTo(Offset newPosition, double newAngle) {
    position = newPosition;
    angle = newAngle;
  }
}
