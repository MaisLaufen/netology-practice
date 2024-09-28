import 'package:flutter/material.dart';

import 'package:netology_practice/core/domain/entities/game_session.dart';

class GameSessionWidget extends StatelessWidget {
  final GameSession session;

  const GameSessionWidget({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Попаданий по мышке: ${session.score}',
                style: TextStyle(fontSize: 18)),
            Text('Всего нажатий: ${session.totalClicks + session.score}',
                style: TextStyle(fontSize: 18)),
            Text('Время начала: ${session.startTime}',
                style: TextStyle(fontSize: 18)),
            Text('Продолжительность: ${session.duration.inSeconds} секунд',
                style: TextStyle(fontSize: 18)),
            Text('Количество мышек в игре: ${session.miceAmount}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
