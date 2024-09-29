import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:netology_practice/core/domain/entities/game_session.dart';

class EndedSessionWidget extends StatelessWidget {
  final GameSession session;

  const EndedSessionWidget({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final formattedStartTime =
        DateFormat('dd-MM-yyyy, HH:mm').format(session.startTime);

    return Card(
      color: const Color(0xFF353535),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedStartTime,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Попаданий по мышке: ${session.score}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Всего нажатий: ${session.totalClicks + session.score}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Продолжительность: ${session.duration.inSeconds} секунд',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Количество мышек в игре: ${session.miceAmount}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
