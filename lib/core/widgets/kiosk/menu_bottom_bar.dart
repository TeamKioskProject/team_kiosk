import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class MenuBottomBar extends ConsumerWidget {
  final KioskTheme theme;

  const MenuBottomBar({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('선택된 메뉴', style: styles.caption),
              const SizedBox(width: 15),
              Text('0', style: styles.accent),
            ],
          ),

          ElevatedButton(
            onPressed: () {},
            child: Text('다음으로', style: styles.button),
          ),
        ],
      ),
    );
  }
}
