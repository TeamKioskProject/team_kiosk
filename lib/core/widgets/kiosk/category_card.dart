import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';


enum Category { burger, cafe }

@immutable
class CategoryCard extends ConsumerWidget {
  final Category category;
  final KioskTheme theme;
  final String text;
  final IconData icon;
  final TextStyleSet textStyleSet;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyles.categoryButton(theme.primary),
      child: FittedBox(
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 5),
            Text(text, style: textStyleSet.button),
          ],
        ),
      ),
    );
  }

  const CategoryCard({
    required this.category,
    required this.theme,
    required this.text,
    required this.icon,
    required this.textStyleSet,
    required this.onTap,
  });
}
