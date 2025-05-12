import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

@immutable
class StepProgressBar extends ConsumerWidget {
  final void Function(int) onTap;
  final List<String> titles;
  final List<Widget> icons;
  final KioskTheme theme;

  const StepProgressBar({
    required this.onTap,
    required this.titles,
    required this.icons,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8),
      child: TabBar(
        onTap: onTap,
        labelColor: theme.primary,
        labelStyle: styles.button.copyWith(fontSize: 18),
        indicatorColor: theme.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 4,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 7),
        unselectedLabelStyle: styles.button.copyWith(
          color: Colors.grey,
          fontSize: 18,
        ),
        tabs: List.generate(
          titles.length,
          (index) => Tab(icon: icons[index], text: titles[index]),
        ),
      ),
    );
  }
}
