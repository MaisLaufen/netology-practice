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

  SettingsWidget({
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
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text('Настройки'),
          SizedBox(height: 20),
          Text('Количество мышек'),
          Slider(
            value: miceAmount,
            min: 1,
            max: 5,
            divisions: 4,
            label: miceAmount.round().toString(),
            onChanged: onSliderChanged,
          ),
          SizedBox(height: 20),
          Text('Размер мышки'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: onDecrementSize,
              ),
              Text(mouseSize.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onIncrementSize,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Скорость мышки'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: onDecrementSpeed,
              ),
              Text(mouseSpeed.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onIncrementSpeed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
