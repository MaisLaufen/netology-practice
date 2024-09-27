import 'package:flutter/material.dart';

const double pi = 3.14;

class MouseWidget extends StatefulWidget {
  final double size;
  final double speed;
  final Offset position;
  final double angle;
  final VoidCallback onTap;

  const MouseWidget(
      {super.key,
      required this.size,
      required this.speed,
      required this.position,
      required this.angle,
      required this.onTap});

  @override
  _MouseWidgetState createState() => _MouseWidgetState();
}

class _MouseWidgetState extends State<MouseWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: (1000 / widget.speed).round()),
      left: widget.position.dx,
      top: widget.position.dy,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation.value, 0),
              child: Transform.rotate(
                angle: widget.angle * pi / 180, // Преобразуем градусы в радианы
                child: SizedBox(
                  width: widget.size * 25,
                  height: widget.size * 25,
                  child: Image.asset(
                    'lib/core/assets/images/mouse.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
