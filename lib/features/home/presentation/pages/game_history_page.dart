import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netology_practice/core/domain/cache/hive_local_storage.dart';
import 'package:netology_practice/features/home/domain/viewmodels/game_history_viewmodel.dart';
import 'package:netology_practice/features/home/presentation/widgets/ended_game.dart';
import 'package:provider/provider.dart';

class GameHistoryPage extends StatelessWidget {
  const GameHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameHistoryViewmodel(HiveLocalStorage())..loadSessions(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Страница со счетом',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF353535),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
        backgroundColor: const Color(0xFF232323),
        body: Consumer<GameHistoryViewmodel>(
          builder: (context, viewModel, child) {
            if (viewModel.sessions.isEmpty) {
              return const Center(
                child: Text(
                  'Нет сохраненных сессий',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListView.builder(
                  itemCount: viewModel.sessions.length,
                  itemBuilder: (context, index) {
                    final session = viewModel.sessions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: EndedSessionWidget(session: session),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
