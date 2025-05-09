import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';

class MenuSelectScreen extends ConsumerWidget {
  const MenuSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final style = ref.read(textStyleSetProvider);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: KioskAppBar(
          title: '메뉴 선택',
          theme: theme,
          action: [
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.volume_up),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: StepProgressBar(
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Step 1')),
            Center(child: Text('Step 2')),
            Center(child: Text('Step 3')),
            Center(child: Text('Step 4')),
          ],
        ),
      ),
    );
  }
}
