import 'package:flutter/material.dart';
import 'package:netology_practice/core/router/app_router.dart';
import 'package:netology_practice/features/home/domain/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainViewModel(),
      child: MaterialApp.router(
        routerConfig: _appRouter.router,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
