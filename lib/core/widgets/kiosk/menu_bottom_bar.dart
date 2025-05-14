import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';

class MenuBottomBar extends ConsumerWidget {
  final KioskTheme theme;
  final VoidCallback onTap;

  const MenuBottomBar({super.key, required this.theme, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    final theme = ref.read(kioskThemeProvider);
    final cartState = ref.watch(cartNotifierProvider);
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
              Text(
                cartState.cartItems.length.toString(),
                style: styles.accent.copyWith(color: theme.primary),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: onTap,
            style: ButtonStyles.categoryButton(theme.primary).copyWith(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
            ),
            child: Text('다음으로', style: styles.button),
          ),
        ],
      ),
    );
  }
}
