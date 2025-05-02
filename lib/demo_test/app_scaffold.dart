import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_provider.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';

class AppScaffold extends ConsumerWidget {
  final String? title;
  final Widget? floatingActionButton;
  final Widget Function(BuildContext context, KioskTheme theme, TextStyleSet styles) builder;

  const AppScaffold({
    super.key,
    this.title,
    this.floatingActionButton,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final theme = KioskTheme.fromMode(kioskModeFromAppMode(appState.mode));
    final styles = AppTextStyles.of(appState.isBarrierFree);

    return Scaffold(
      backgroundColor: theme.background,
      body: SafeArea(
        child: builder(context, theme, styles),
      ),
    );
  }
}