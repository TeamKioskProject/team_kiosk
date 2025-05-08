import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';

class PlaceSelectScreen extends ConsumerWidget {
  final KioskTheme theme;
  final kiosk.Category category;

  const PlaceSelectScreen({
    super.key,
    required this.theme,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBurger = category;
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
            children: [
              Kioskbutton(
                text:
                    isBurger == kiosk.Category.burger
                        ? '햄버거를 어디서 드시겠어요?'
                        : '커피를 어디서 드시겠어요?',
                theme: theme,
                category: category,
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
