import 'package:flutter/material.dart';
import 'package:netology_practice/core/presentation/custom_button.dart';
import 'package:provider/provider.dart';

import 'package:netology_practice/features/home/presentation/widgets/settings.dart';

import 'package:netology_practice/features/home/domain/viewmodels/home_viewmodel.dart';

import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главный экран',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF353535),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance, color: Colors.white),
            onPressed: () {
              context.go('/game_history');
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF232323),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return SettingsWidget(
                  miceAmount: viewModel.gameSettings.miceAmount,
                  mouseSize: viewModel.gameSettings.mouseSize,
                  mouseSpeed: viewModel.gameSettings.mouseSpeed,
                  onSliderChanged: (value) => viewModel.setMiceAmount(value),
                  onIncrementSize: viewModel.incrementMouseSize,
                  onDecrementSize: viewModel.decrementMouseSize,
                  onIncrementSpeed: viewModel.incrementMouseSpeed,
                  onDecrementSpeed: viewModel.decrementMouseSpeed,
                );
              },
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return CustomButton(
                  onPressed: () {
                    context.go('/game', extra: viewModel.gameSettings);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
