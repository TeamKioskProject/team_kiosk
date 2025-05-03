import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

enum Category { burger, cafe }

class CategoryCard extends ConsumerWidget {
  final Category category;
  final KioskTheme theme;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryCard({
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
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ButtonStyles.categoryButton(theme.primary),
          child: FittedBox(
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 30),
                const SizedBox(width: 5),
                Text(text, style: styles.button),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
