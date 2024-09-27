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
      title: const Text('Игра на паузе'),
      content: const Text('Вы хотите закончить игру или продолжить?'),
      actions: [
        TextButton(
          onPressed: onEndGame,
          child: const Text('Закончить'),
        ),
        TextButton(
          onPressed: onResumeGame,
          child: const Text('Продолжить'),
        ),
      ],
    );
  }
}
