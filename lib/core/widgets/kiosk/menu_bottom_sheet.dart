import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class MenuBottomSheet extends ConsumerWidget {
  final KioskTheme theme;
  final String text;

  const MenuBottomSheet({super.key, required this.theme, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: double.infinity,
      color: theme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: AutoSizeText('$text 선택 완료', style: styles.button, maxLines: 1),
      ),
    );
  }
}
