import 'package:flutter/material.dart';
import 'package:netology_practice/core/domain/entities/game_settings.dart';
import 'package:netology_practice/features/game/domain/viewmodels/game_viewmodel.dart';
import 'package:netology_practice/features/game/presentation/widgets/mouse.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  final GameSettings settings;

  GameScreen({required this.settings});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameViewModel(
          settings: settings, screenSize: MediaQuery.of(context).size),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game Screen'),
        ),
        body: Consumer<GameViewModel>(
          builder: (context, viewModel, child) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                viewModel.onScreenClick();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Количество нажатий: ${viewModel.gameSession.totalClicks}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Количество попаданий по мышке: ${viewModel.gameSession.score}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ...viewModel.gameSession.mice.map((mouse) {
                    return MouseWidget(
                      size: mouse.size,
                      position: mouse.position,
                      onTap: () => viewModel.onMouseClick(mouse),
                    );
                  }).toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
