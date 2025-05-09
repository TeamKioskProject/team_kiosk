import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';

class MenuCard extends ConsumerWidget {
  final String image;
  final String title;
  final int price;
  final KioskTheme theme;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
