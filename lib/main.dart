import 'package:flutter/material.dart';
import 'package:netology_practice/core/domain/utils/service_locator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netology_practice/core/router/app_router.dart';
import 'package:netology_practice/features/home/domain/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'core/domain/entities/game_session.dart';
import 'core/domain/utils/duration_adapter.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(GameSessionAdapter());
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
