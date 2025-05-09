import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class MenuCard extends ConsumerWidget {
  final String image;
  final String title;
  final int price;
  final KioskTheme theme;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return Container(
      width: double.infinity,
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/hamburger.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(title, style: styles.headline2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₩ ${price.toString()}', style: styles.accent),
                Text('단품/세트', style: styles.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
