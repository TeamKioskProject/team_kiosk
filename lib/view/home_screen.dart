import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/first_select_category.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider.notifier);
    final theme = ref.read(kioskThemeProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Semantics(
                  label: "오늘의 주문 연습 시작",
                  button: true,
                  child: KioskButton(
                    text: "오늘은 어떤 주문을 연습해볼까요?",
                    theme: KioskTheme.fromMode(KioskMode.burger),
                    category: theme == KioskTheme.fromMode(KioskMode.burger)
                        ? kiosk.Category.burger
                        : kiosk.Category.cafe,
                  ),
                ),
              ),
              Semantics(
                label: "주문 안내 애니메이션",
                child: Lottie.asset('assets/lottie/order_lottie.json',
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Semantics(
                  label: "햄버거 주문 연습",
                  button: true,
                  child: FirstSelectCategory(
                    icon: Icons.fastfood,
                    category: Category.burger,
                    theme: KioskTheme.fromMode(KioskMode.burger),
                    text: '햄버거 주문 연습 하기',
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Semantics(
                  label: "카페 주문 연습",
                  button: true,
                  child: FirstSelectCategory(
                    icon: Icons.local_cafe,
                    category: Category.cafe,
                    theme: KioskTheme.fromMode(KioskMode.cafe),
                    text: '카페 주문 연습 하기',
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
