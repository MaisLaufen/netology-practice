import 'package:flutter/material.dart';

class PauseDialog extends StatelessWidget {
  final VoidCallback onEndGame;
  final VoidCallback onResumeGame;

  const PauseDialog({
    super.key,
    required this.onEndGame,
    required this.onResumeGame,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF353535),
      title: const Text(
        'Игра на паузе',
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        'Вы хотите закончить игру или продолжить?',
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        TextButton(
          onPressed: onEndGame,
          child: const Text(
            'Закончить',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        TextButton(
          onPressed: onResumeGame,
          child: const Text(
            'Продолжить',
            style: TextStyle(color: Colors.greenAccent),
          ),
        ),
      ],
    );
  }
}
