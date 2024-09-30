import 'dart:ui';

class Mouse {
  double size;
  double speed;
  Offset position;
  double angle;
  String image;

  Mouse({
    required this.size,
    required this.speed,
    required this.position,
    required this.image,
    this.angle = 0.0,
  });

  void moveTo(Offset newPosition, double newAngle) {
    position = newPosition;
    angle = newAngle;
  }
}
