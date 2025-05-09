import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/view/home_screen.dart';
import 'package:team_kiosk/view/kiosk_start_page/kiosk_start_page.dart';
import 'package:team_kiosk/view/main_select/menu_select_screen.dart';
import 'package:team_kiosk/view/place_select/place_select_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // 라우터 객체 생성
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/place-select-screen',
        builder: (context, state) => const PlaceSelectScreen(),
      ),
      GoRoute(
        path: '/kiosk-start-page',
        builder: (context, state) => const KioskStartPage(),
      ),
      GoRoute(
        path: '/menu-select-screen',
        builder: (context, state) => const MenuSelectScreen(),
      ),
    ],
  );
  return router;
});
