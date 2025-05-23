import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

@immutable
class SelectableTile extends ConsumerWidget {
  final String image;
  final String title;
  final IconData icon;
  final KioskTheme theme;
  final VoidCallback onTap;

  const SelectableTile({
    super.key,
    required this.theme,
    required this.icon,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ButtonStyles.kioskButton(Colors.white),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            //Image.asset(image, width: double.infinity, fit: BoxFit.cover),
            Lottie.asset(image, width: double.infinity, fit: BoxFit.cover),
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
                          style: styles.headline2,
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
