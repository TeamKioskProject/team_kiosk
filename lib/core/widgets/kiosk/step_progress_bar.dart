import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';

@immutable
class StepProgressBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final String title2;
  final IconData icon2;
  final String title3;
  final IconData icon3;
  final String title4;
  final IconData icon4;
  final KioskTheme theme;
  final TextStyleSet textStyleSet;

  const StepProgressBar(
    this.title,
    this.icon,
    this.title2,
    this.icon2,
    this.title3,
    this.icon3,
    this.title4,
    this.icon4,
    this.theme,
    this.textStyleSet, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TabBar(
        labelColor: theme.primary,
        labelStyle: textStyleSet.button,
        indicatorColor: theme.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 4,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 7),
        unselectedLabelStyle: textStyleSet.button.copyWith(color: Colors.grey),
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
