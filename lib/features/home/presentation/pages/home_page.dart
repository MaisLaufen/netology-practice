import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:netology_practice/features/home/presentation/widgets/settings.dart';

import 'package:netology_practice/features/home/domain/viewmodels/home_viewmodel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Главный экран'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance),
            onPressed: () {
              // TODO: Переход на страницу со счетом
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<MainViewModel>(
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
            ElevatedButton(
              onPressed: () {
                // TODO: Действие при нажатии кнопки старт
              },
              child: Text('Старт'),
            ),
          ],
        ),
      ),
    );
  }
}
