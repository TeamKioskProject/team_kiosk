import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/view/cart/cart_screen.dart';
import 'package:team_kiosk/view/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // 모드에 따른 테마와 텍스트 스타일 선택
  final theme = ref.watch(kioskThemeProvider);
  final styles = ref.watch(textStyleSetProvider);

  // 라우터 객체 생성
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    ],
  );
  return router;
});
