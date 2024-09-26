import 'package:flutter/material.dart';
import 'package:netology_practice/features/home/domain/entities/game_settings.dart';

class MainViewModel extends ChangeNotifier {
  final GameSettings _gameSettings =
      GameSettings(miceAmount: 1, mouseSize: 1, mouseSpeed: 1);

  GameSettings get gameSettings => _gameSettings;

  void setMiceAmount(double value) {
    _gameSettings.miceAmount = value;
    notifyListeners();
  }

  void incrementMouseSize() {
    if (_gameSettings.mouseSize < 10) {
      _gameSettings.mouseSize++;
      notifyListeners();
    }
  }

  void decrementMouseSize() {
    if (_gameSettings.mouseSize > 1) {
      _gameSettings.mouseSize--;
      notifyListeners();
    }
  }

  void incrementMouseSpeed() {
    if (_gameSettings.mouseSpeed < 10) {
      _gameSettings.mouseSpeed++;
      notifyListeners();
    }
  }

  void decrementMouseSpeed() {
    if (_gameSettings.mouseSpeed > 1) {
      _gameSettings.mouseSpeed--;
      notifyListeners();
    }
  }
}
