import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class KioskAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final KioskTheme theme;
  final List<Widget>? action;
  final Widget? leading;

  const KioskAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.action,
    this.leading,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: styles.headline2.copyWith(color: theme.primary),
      ),
      centerTitle: centerTitle,
      actions: action,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
