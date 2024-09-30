import 'dart:math';
import 'package:flutter/material.dart';

class ImageAngle {
  static double calculateRotationAngle(Offset oldPosition, Offset newPosition) {
    final dx = newPosition.dx - oldPosition.dx;
    final dy = newPosition.dy - oldPosition.dy;
    final angle = atan2(dy, dx);
    return angle * 180 / pi - 90; // Преобразуем радианы в градусы
  }
}
