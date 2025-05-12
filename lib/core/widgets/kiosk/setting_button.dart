import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

@immutable
class SettingButton extends ConsumerWidget {
  final String text;
  final IconData icon;
  final KioskTheme theme;
  final void Function() onTap;

  const SettingButton({
    super.key,
    required this.text,
    required this.icon,
    required this.theme,
    required this.onTap
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: ButtonStyles.kioskButton(Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 22),
              const SizedBox(width: 5),
              Text(
                text,
                style: styles.headline2.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
