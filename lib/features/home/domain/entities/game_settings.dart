class GameSettings {
  double _miceAmount;
  int _mouseSize;
  int _mouseSpeed;

  GameSettings({
    required double miceAmount,
    required int mouseSize,
    required int mouseSpeed,
  })  : _miceAmount = miceAmount,
        _mouseSize = mouseSize,
        _mouseSpeed = mouseSpeed;

  double get miceAmount => _miceAmount;
  int get mouseSize => _mouseSize;
  int get mouseSpeed => _mouseSpeed;

  set miceAmount(double value) {
    _miceAmount = value;
  }

  set mouseSize(int value) {
    if (value >= 1 && value <= 10) {
      _mouseSize = value;
    }
  }

  set mouseSpeed(int value) {
    if (value >= 1 && value <= 10) {
      _mouseSpeed = value;
    }
  }
}
