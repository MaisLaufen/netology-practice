import 'package:flutter/material.dart';
import 'package:netology_practice/features/home/domain/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewModel()),
        //ChangeNotifierProvider(create: (context) => AnotherViewModel()), // Добавьте другие ViewModel
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
