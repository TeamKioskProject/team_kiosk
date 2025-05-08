import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/view/home_screen.dart';
import 'package:team_kiosk/view/kiosk_start_page/kiosk_start_page.dart';
import 'package:team_kiosk/view/place_select/place_select_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // 모드에 따른 테마와 텍스트 스타일 선택
  final theme = ref.watch(kioskThemeProvider);
  final styles = ref.watch(textStyleSetProvider);

  // 라우터 객체 생성
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            backgroundColor: theme.background,
            body: SafeArea(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/place-select',
            builder:
                (context, state) =>
                    PlaceSelectScreen(theme: theme, textStyles: styles),
          ),
          GoRoute(
            path: '/kiosk-start-page',
            builder: (context, state) {
              final categoryStr = state.uri.queryParameters['category'];
              final category =
                  categoryStr == 'cafe'
                      ? Category.cafe
                      : Category.burger; // 'cafe' 파라미터를 확인하여 카테고리 결정
              final theme =
                  category == Category.burger
                      ? KioskTheme.fromMode(KioskMode.burger)
                      : KioskTheme.fromMode(KioskMode.cafe);
              return KioskStartPage(
                category: category,
                theme: theme,
              ); // KioskStartPage로 category와 theme 전달
            },
          ),
        ],
      ),
    ],
  );
  return router;
});
