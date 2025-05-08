import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';

/// KioskTheme 제공
final kioskThemeProvider = Provider<KioskTheme>((ref) {
  final appState = ref.watch(appStateProvider);
  return KioskTheme.fromMode(kioskModeFromAppMode(appState.mode));
});

/// TextStyleSet 제공
final textStyleSetProvider = Provider<TextStyleSet>((ref) {
  final appState = ref.watch(appStateProvider);
  return AppTextStyles.of(appState.isBarrierFree);
});

/// AppMode → KioskMode 변환
KioskMode kioskModeFromAppMode(AppMode mode) {
  switch (mode) {
    case AppMode.burger:
      return KioskMode.burger;
    case AppMode.cafe:
      return KioskMode.cafe;
  }
}
