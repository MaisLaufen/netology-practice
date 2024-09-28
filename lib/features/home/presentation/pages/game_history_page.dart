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
          title: const Text('Страница со счетом'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
        body: Consumer<GameHistoryViewmodel>(
          builder: (context, viewModel, child) {
            if (viewModel.sessions.isEmpty) {
              return const Center(child: Text('Нет сохраненных сессий'));
            } else {
              return ListView.builder(
                itemCount: viewModel.sessions.length,
                itemBuilder: (context, index) {
                  final session = viewModel.sessions[index];
                  return GameSessionWidget(session: session);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
