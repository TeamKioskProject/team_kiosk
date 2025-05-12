import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

@immutable
class StepProgressBar extends ConsumerWidget {
  final String title;
  final IconData icon;
  final String title2;
  final IconData icon2;
  final String? title3;
  final IconData? icon3;
  final String? title4;
  final IconData? icon4;
  final KioskTheme theme;

  const StepProgressBar(
    this.title,
    this.icon,
    this.title2,
    this.icon2, {
    this.title3,
    this.icon3,
    this.title4,
    this.icon4,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);

    final List<Tab> tabs = [
      Tab(icon: Icon(icon), text: title),
      Tab(icon: Icon(icon2), text: title2),
    ];

    if (title3 != null && icon3 != null) {
      tabs.add(Tab(icon: Icon(icon3), text: title3));
    }

    if (title4 != null && icon4 != null) {
      tabs.add(Tab(icon: Icon(icon4), text: title4));
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8),
      child: TabBar(
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
        tabs: tabs,
      ),
    );
  }
}
