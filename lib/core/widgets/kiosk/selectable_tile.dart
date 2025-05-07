import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';

@immutable
class SelectableTile extends StatelessWidget {
  final String image;
  final String title;
  final IconData icon;
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final VoidCallback onTap;

  const SelectableTile({
    super.key,
    required this.theme,
    required this.onTap,
    required this.image,
    required this.title,
    required this.textStyleSet,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ButtonStyles.kioskButton(Colors.white),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(image, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(icon, color: theme.primary, size: 28),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          title,
                          style: textStyleSet.headline2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
