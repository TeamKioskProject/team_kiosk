import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class StepProgressBar extends ConsumerWidget {
  final String title;
  final IconData icon;
  final String title2;
  final IconData icon2;
  final String title3;
  final IconData icon3;
  final String title4;
  final IconData icon4;
  final KioskTheme theme;

  const StepProgressBar(
    this.theme,
    this.title,
    this.icon,
    this.title2,
    this.icon2,
    this.title3,
    this.icon3,
    this.title4,
    this.icon4, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TabBar(
        labelColor: theme.primary,
        labelStyle: styles.button,
        indicatorColor: theme.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 4,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 7),
        unselectedLabelStyle: styles.button.copyWith(color: Colors.grey),
        tabs: [
          Column(children: [Icon(icon), Tab(text: title)]),
          Column(children: [Icon(icon2), Tab(text: title2)]),
          Column(children: [Icon(icon3), Tab(text: title3)]),
          Column(children: [Icon(icon4), Tab(text: title4)]),
        ],
      ),
    );
  }
}
