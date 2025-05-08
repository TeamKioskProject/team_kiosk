import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
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
            builder: (context, state) => KioskStartPage(theme: theme),
          ),
        ],
      ),
    ],
  );
  return router;
});
