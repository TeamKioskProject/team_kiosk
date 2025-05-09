import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/selectable_tile.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KioskButton(
                text:
                    theme == KioskTheme.fromMode(KioskMode.burger)
                        ? '햄버거를 어디서 드시겠어요?'
                        : '커피를 어디서 드시겠어요?',
                theme: theme,
                category:
                    theme == KioskTheme.fromMode(KioskMode.burger)
                        ? kiosk.Category.burger
                        : kiosk.Category.cafe,
              ),
              const SizedBox(height: 20),
              SelectableTile(
                theme: theme,
                icon: Icons.restaurant,
                image: 'assets/images/inside.png',
                title: '매장에서 먹을래요',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SelectableTile(
                theme: theme,
                icon: Icons.shopping_bag,
                image: 'assets/images/take.png',
                title: '가져갈래요',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
