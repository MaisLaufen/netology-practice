import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netology_practice/core/domain/entities/game_settings.dart';
import 'package:netology_practice/features/game/domain/viewmodels/game_viewmodel.dart';
import 'package:netology_practice/features/game/presentation/widgets/curr_session_info.dart';
import 'package:netology_practice/features/game/presentation/widgets/mouse_widget.dart';
import 'package:provider/provider.dart';

import '../dialogs/pause_dialog.dart';

class GameScreen extends StatelessWidget {
  final GameSettings settings;

  const GameScreen({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameViewModel(
          settings: settings, screenSize: MediaQuery.of(context).size),
      child: Scaffold(
        backgroundColor: const Color(0xFF232323),
        appBar: AppBar(
          title: const Text(
            'Игра',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF353535),
          actions: [
            Consumer<GameViewModel>(
              builder: (context, viewModel, child) {
                return Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        viewModel.isPaused ? Icons.play_arrow : Icons.pause,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (viewModel.isPaused) {
                          viewModel.resumeGame();
                        } else {
                          viewModel.pauseGame();
                          _showPauseDialog(context, viewModel);
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.exit_to_app, color: Colors.white),
                      onPressed: () {
                        viewModel.endGame();
                        context.go('/');
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: Consumer<GameViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CurrentSessionInfo(
                    totalClicks: viewModel.gameSession.totalClicks,
                    score: viewModel.gameSession.score,
                    duration: viewModel.gameSession.duration,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      viewModel.onScreenClick();
                    },
                    child: Stack(
                      children: viewModel.gameSession.mice.map((mouse) {
                        return MouseWidget(
                          size: mouse.size,
                          speed: mouse.speed,
                          position: mouse.position,
                          angle: mouse.angle,
                          onTap: () => viewModel.onMouseClick(mouse),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showPauseDialog(BuildContext context, GameViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        return PauseDialog(
          onEndGame: () {
            viewModel.endGame();
            context.go('/');
          },
          onResumeGame: () {
            viewModel.resumeGame();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
