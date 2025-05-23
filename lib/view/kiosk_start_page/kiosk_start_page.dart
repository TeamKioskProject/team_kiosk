import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/setting_button.dart';

class KioskStartPage extends ConsumerWidget {
  const KioskStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider.notifier);
    final theme = ref.watch(kioskThemeProvider);
    final style = ref.watch(textStyleSetProvider);

    return Scaffold(
      appBar: KioskAppBar(
        title: '키오스크 연습',
        theme: theme,
        action: [
          Semantics(
            label: '음량 버튼',
            hint: '음량을 조절할 수 있습니다',
            button: true,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.volume_up),
            ),
          ),
        ],
      ),
      backgroundColor: theme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Semantics(
                label: '주문 연습 시작 버튼',
                hint: '누르면 오늘의 주문 연습을 시작합니다',
                button: true,
                child: KioskButton(
                  text: '오늘은 몇 가지 주문을 연습해볼까요?',
                  theme: theme,
                  category: theme == KioskTheme.fromMode(KioskMode.burger) ? kiosk.Category.burger : kiosk.Category.cafe,
                ),
              ),
              const SizedBox(height: 10),
              Semantics(
                label: theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거 주문 안내 애니메이션' : '카페 주문 안내 애니메이션',
                child: Lottie.asset(
                  theme == KioskTheme.fromMode(KioskMode.burger) ? 'assets/lottie/hambuger_lottie.json' : 'assets/lottie/coffe_lottie.json',
                ),
              ),
              const SizedBox(height: 10),
              Semantics(
                label: theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거 주문 연습 시작 버튼' : '카페 주문 연습 시작 버튼',
                hint: '누르면 주문 연습이 시작됩니다',
                button: true,
                child: kiosk.CategoryCard(
                  icon: theme == KioskTheme.fromMode(KioskMode.burger) ? Icons.fastfood : Icons.local_cafe,
                  category: theme == KioskTheme.fromMode(KioskMode.burger) ? kiosk.Category.burger : kiosk.Category.cafe,
                  theme: theme,
                  text: theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거 주문 연습 하기' : '카페 주문 연습 하기',
                  onTap: () {
                    context.push('/place-select-screen');
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text('※ 실제 주문이 발생하지 않는 연습용 앱입니다', style: style.body),
              const SizedBox(height: 20),
              Semantics(
                label: '글자 크기 설정 버튼',
                hint: ref.read(appStateProvider).isBarrierFree ? '글자를 원래대로 설정합니다' : '글자를 크고 진하게 설정합니다',
                button: true,
                child: SettingButton(
                  text: ref.read(appStateProvider).isBarrierFree ? '글자를 원래대로 해주세요' : '글자를 크고 진하게 해주세요',
                  icon: Icons.text_fields,
                  theme: theme,
                  onTap: () {
                    if (ref.read(appStateProvider).isBarrierFree) {
                      ref.read(appStateProvider.notifier).setBarrierFree(false);
                    } else {
                      ref.read(appStateProvider.notifier).setBarrierFree(true);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
