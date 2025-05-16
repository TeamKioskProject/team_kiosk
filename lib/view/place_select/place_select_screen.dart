import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/selectable_tile.dart';
import 'package:team_kiosk/view/main_menu/menu_select_notifier.dart';

class PlaceSelectScreen extends ConsumerWidget {
  const PlaceSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final style = ref.read(textStyleSetProvider);
    return Scaffold(
      appBar: KioskAppBar(
        title: '주문하기',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Semantics(
                label: theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거 장소 선택' : '커피 장소 선택',
                hint: '누르면 장소를 선택할 수 있습니다',
                button: true,
                child: KioskButton(
                  text: theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거를 어디서 드시겠어요?' : '커피를 어디서 드시겠어요?',
                  theme: theme,
                  category: theme == KioskTheme.fromMode(KioskMode.burger) ? kiosk.Category.burger : kiosk.Category.cafe,
                ),
              ),
              const SizedBox(height: 20),
              Semantics(
                label: '매장에서 먹기 선택',
                hint: '누르면 매장에서 음식을 먹는 옵션을 선택할 수 있습니다',
                button: true,
                child: SelectableTile(
                  theme: theme,
                  icon: Icons.restaurant,
                  image: 'assets/lottie/select_toeat_lottie.json',
                  title: '매장에서 먹을래요',
                  onTap: () {
                    context.push('/menu-select-screen');
                    ref.read(menuSelectNotifierProvider.notifier).resetState();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Semantics(
                label: '포장 선택',
                hint: '누르면 음식을 가져가는 옵션을 선택할 수 있습니다',
                button: true,
                child: SelectableTile(
                  theme: theme,
                  icon: Icons.shopping_bag,
                  image: 'assets/lottie/select_takeout_lottie.json',
                  title: '가져갈래요',
                  onTap: () {
                    context.push('/menu-select-screen');
                    ref.read(menuSelectNotifierProvider.notifier).resetState();
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
