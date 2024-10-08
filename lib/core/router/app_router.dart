import 'package:go_router/go_router.dart';

import 'package:netology_practice/core/domain/entities/game_settings.dart';
import 'package:netology_practice/features/game/presentation/pages/game_page.dart';
import 'package:netology_practice/features/home/presentation/pages/game_history_page.dart';
import 'package:netology_practice/features/home/presentation/pages/home_page.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/game',
              builder: (context, state) {
                final settings = state.extra as GameSettings;
                return GameScreen(settings: settings);
              },
            ),
            GoRoute(
              path: '/game_history',
              builder: (context, state) => const GameHistoryPage(),
            ),
          ],
        );
}
