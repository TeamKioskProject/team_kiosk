import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';

@immutable
class KioskAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final List<Widget>? action;
  final Widget? leading;

  const KioskAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.action,
    this.leading,
    required this.theme,
    required this.textStyleSet,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: textStyleSet.headline2.copyWith(color: theme.primary),
      ),
      centerTitle: centerTitle,
      actions: action,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
