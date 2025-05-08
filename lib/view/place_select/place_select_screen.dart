import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';

class PlaceSelectScreen extends StatelessWidget {
  final KioskTheme theme;
  final TextStyleSet textStyles;

  const PlaceSelectScreen({
    super.key,
    required this.theme,
    required this.textStyles,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [Text('매장 or tatke out')]);
  }
}
