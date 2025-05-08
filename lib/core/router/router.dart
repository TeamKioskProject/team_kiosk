import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/view/home_screen.dart';
import 'package:team_kiosk/view/place_select/place_select_screen.dart';
import 'package:team_kiosk/core/widgets/menu/set_menu_selector.dart';
import 'package:team_kiosk/core/widgets/menu/ingredient_selector.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // 모드에 따른 테마와 텍스트 스타일 선택
  final theme = ref.watch(kioskThemeProvider);
  final styles = ref.watch(textStyleSetProvider);

  // 라우터 객체 생성
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => const HomeScreen(),
      ),
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
            path: '/set-menu',
            builder: (context, state) => SetMenuSelector(
              mainName: '치즈버거',
              mainPrice: '6,900원',
              mainImage: '',
              sides: [
                SetMenuOption(label: '감자튀김', image: '', imgSize: '127x128'),
                SetMenuOption(label: '치킨너겟', image: '', imgSize: '131x128'),
              ],
              drinks: [
                SetMenuOption(label: '콜라', image: '', imgSize: '127x128'),
                SetMenuOption(label: '사이다', image: '', imgSize: '131x128'),
              ],
              selectedSide: 0,
              selectedDrink: 0,
              onComplete: () {
                // 디버깅용 로그 추가
                print('선택 완료 버튼 클릭됨');
                context.push('/ingredient-select');
              },
              onSelectSide: (i) {},
              onSelectDrink: (i) {},
            ),
          ),
          GoRoute(
            path: '/ingredient-select',
            builder: (context, state) => const IngredientSelector(),
          ),
        ],
      ),
    ],
  );
  return router;
});
