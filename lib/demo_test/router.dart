import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/state/app_state.dart';
import 'package:team_kiosk/demo_test/demo_test_color_screen.dart';
import 'package:team_kiosk/demo_test/demo_test_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const DemoTestScreen();
      },
    ),
  ],
);
