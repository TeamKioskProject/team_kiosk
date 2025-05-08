import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/setting_button.dart';

class KioskStartPage extends ConsumerWidget {
  final kiosk.Category category;
  final KioskTheme theme;

  const KioskStartPage({
    super.key,
    required this.category,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBurger = category;

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
              Kioskbutton(
                text: '오늘은 몇 가지 주문을 연습해볼까요?',
                theme: theme,
                category: category,
              ),
              const SizedBox(height: 22),
              Image.asset(
                isBurger == kiosk.Category.burger
                    ? 'assets/images/hamburger.png'
                    : 'assets/images/coffee_ill.png',
                width: 192,
                height: 192,
              ),
              const SizedBox(height: 22),
              Semantics(
                label:
                    isBurger == kiosk.Category.burger
                        ? '햄버거 주문 연습 시작 버튼'
                        : '카페 주문 연습 시작 버튼',
                hint: '누르면 주문 연습이 시작됩니다',
                button: true,
                excludeSemantics: true,
                child: kiosk.CategoryCard(
                  icon:
                      isBurger == kiosk.Category.burger
                          ? Icons.fastfood
                          : Icons.local_cafe,
                  category: category,
                  theme: theme,
                  text:
                      isBurger == kiosk.Category.burger
                          ? '햄버거 주문 연습 하기'
                          : '카페 주문 연습 하기',
                  onTap: () {
                    print('선택된 카테고리: ${category.name}');
                    context.push("/place-select?category=${category.name}");
                  },
                ),
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
