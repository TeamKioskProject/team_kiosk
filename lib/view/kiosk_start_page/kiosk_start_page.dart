import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/setting_button.dart';

class KioskStartPage extends ConsumerWidget {
  final KioskTheme theme;

  const KioskStartPage({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    return Scaffold(
      appBar: KioskAppBar(
        title: '키오스크 연습',
        theme: theme,
        action: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0), // 원하는 만큼 조절
            child: Icon(Icons.volume_up),
          ),
        ],
      ),
      backgroundColor: theme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Kioskbutton(text: '오늘은 몇 가지 주문을 연습해볼까요?', theme: theme),
              const SizedBox(height: 22),
              Image.asset(
                'assets/images/hamburger.png',
                width: 192,
                height: 192,
              ),
              const SizedBox(height: 22),
              CategoryCard(
                icon: Icons.fastfood,
                category: Category.burger,
                theme: KioskTheme.fromMode(KioskMode.burger),
                text: '햄버거 주문 연습 하기',
                onTap: () {
                  context.push("/place-select");
                },
              ),
              const SizedBox(height: 20),
              const Text('※ 실제 주문이 발생하지 않는 연습용 앱입니다'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SettingButton(
                      text: '앱 사용법 보기',
                      icon: Icons.help,
                      theme: theme,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SettingButton(
                      text: '설정',
                      icon: Icons.settings,
                      theme: theme,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
