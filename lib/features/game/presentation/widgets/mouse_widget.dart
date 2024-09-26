import 'package:flutter/material.dart';

class MouseWidget extends StatelessWidget {
  final double size;
  final Offset position;
  final VoidCallback onTap;

  MouseWidget(
      {required this.size, required this.position, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: (1000 / size).round()),
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size * 50,
          height: size * 50,
          color: Colors.grey,
        ),
      ),
    );
  }
}
