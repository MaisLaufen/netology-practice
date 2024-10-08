import 'package:flutter/material.dart';
import 'package:netology_practice/core/internal/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Local storage:
import 'package:netology_practice/core/domain/utils/service_locator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/domain/entities/game_session.dart';
import 'core/domain/utils/duration_adapter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupServiceLocator();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(GameSessionAdapter());
  runApp(App());
  await Future.delayed(const Duration(milliseconds: 500));
  FlutterNativeSplash.remove();
}
