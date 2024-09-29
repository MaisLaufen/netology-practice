import 'package:flutter/material.dart';

class CurrentSessionInfo extends StatelessWidget {
  final int totalClicks;
  final int score;
  final Duration duration;

  const CurrentSessionInfo({
    super.key,
    required this.totalClicks,
    required this.score,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF353535),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Количество нажатий: $totalClicks',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Количество попаданий по мышке: $score',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Время сессии: ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
