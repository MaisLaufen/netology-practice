import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final double miceAmount;
  final int mouseSize;
  final int mouseSpeed;
  final ValueChanged<double> onSliderChanged;
  final VoidCallback onIncrementSize;
  final VoidCallback onDecrementSize;
  final VoidCallback onIncrementSpeed;
  final VoidCallback onDecrementSpeed;

  const SettingsWidget({
    super.key,
    required this.miceAmount,
    required this.mouseSize,
    required this.mouseSpeed,
    required this.onSliderChanged,
    required this.onIncrementSize,
    required this.onDecrementSize,
    required this.onIncrementSpeed,
    required this.onDecrementSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF353535),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Настройки',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Количество мышек',
            style: TextStyle(color: Colors.white70),
          ),
          Slider(
            value: miceAmount,
            min: 1,
            max: 5,
            divisions: 4,
            label: miceAmount.round().toString(),
            onChanged: onSliderChanged,
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.white24,
          ),
          const SizedBox(height: 20),
          const Text(
            'Размер мышки',
            style: TextStyle(color: Colors.white70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: onDecrementSize,
              ),
              Text(
                mouseSize.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: onIncrementSize,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Скорость мышки',
            style: TextStyle(color: Colors.white70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: onDecrementSpeed,
              ),
              Text(
                mouseSpeed.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: onIncrementSpeed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
