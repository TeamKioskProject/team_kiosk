import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';

class MenuSelectScreen extends ConsumerWidget {
  final KioskTheme theme;
  final kiosk.Category category;

  const MenuSelectScreen({
    super.key,
    required this.theme,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: KioskAppBar(title: '메뉴 선택', theme: theme),
      backgroundColor: theme.background,
      body: StepProgressBar(
          '햄버거',
          Icons.lunch_dining,
          '햄버거',
          Icons.lunch_dining,
          '햄버거',
          Icons.lunch_dining,
          '햄버거',
          Icons.lunch_dining,
          theme),
    );
  }
}
