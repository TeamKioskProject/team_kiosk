import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

@immutable
class KioskAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final KioskTheme theme;
  final List<Widget>? action;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  const KioskAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.action,
    this.leading,
    this.bottom,
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
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}
