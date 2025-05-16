import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/view/set_builder/set_builder_notification.dart';

class OrderCompleteScreen extends ConsumerWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final textStyles = ref.read(textStyleSetProvider);
    final setBuilderState = ref.watch(setBuilderProvider.notifier);

    int number = Random().nextInt(100) + 1;

    return Scaffold(
      appBar: KioskAppBar(title: '진동벨 확인', theme: theme, centerTitle: true),
      body: Container(
        color: theme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${number.toString()}번',
              style: textStyles.headline1.copyWith(
                fontSize: 100,
                color: theme.primary,
              ),
            ),
            Center(child: Text('고객님', style: textStyles.headline2)),
            Center(child: Text('메뉴가 준비됐습니다.', style: textStyles.headline2)),
            const SizedBox(height: 30),

            Semantics(
              button: true,
              label: '처음으로 돌아가기 버튼',
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.all(16),
                child: CategoryCard(
                  icon: Icons.refresh,
                  category:
                      theme == KioskTheme.fromMode(KioskMode.burger)
                          ? Category.burger
                          : Category.cafe,
                  theme: theme,
                  text: '처음으로',
                  onTap: () {
                    context.go('/');
                    setBuilderState.selectSideMenu(name: '', uri: '');
                    setBuilderState.selectDrinkMenu(name: '', uri: '');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
