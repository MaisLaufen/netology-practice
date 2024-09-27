import 'package:flutter/material.dart';

import 'package:netology_practice/core/domain/entities/game_session.dart';

class GameSessionWidget extends StatelessWidget {
  final GameSession session;

  GameSessionWidget({required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Score: ${session.score}', style: TextStyle(fontSize: 18)),
            Text('Total Clicks: ${session.totalClicks}',
                style: TextStyle(fontSize: 18)),
            Text('Start Time: ${session.startTime}',
                style: TextStyle(fontSize: 18)),
            Text('Duration: ${session.duration.inSeconds} seconds',
                style: TextStyle(fontSize: 18)),
            Text('Mice Count: ${session.miceAmount}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
