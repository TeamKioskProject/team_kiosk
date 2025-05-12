import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';

enum Category { burger, cafe }

@immutable
class FirstSelectCategory extends ConsumerWidget {
  final Category category;
  final KioskTheme theme;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const FirstSelectCategory({
    super.key,
    required this.icon,
    required this.category,
    required this.theme,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    final appState = ref.watch(appStateProvider.notifier);
    return ElevatedButton(
      onPressed: () {
        switch (category) {
          case Category.burger:
            appState.changeMode(AppMode.burger);
            break;
          case Category.cafe:
            appState.changeMode(AppMode.cafe);
            break;
        }
        context.push('/kiosk-start-page');
      },
      style: ButtonStyles.categoryButton(theme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(width: 5),
          Text(text, style: styles.button),
        ],
      ),
    );
  }
}
