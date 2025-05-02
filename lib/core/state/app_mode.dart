import 'package:team_kiosk/core/constants/app_colors.dart';

enum AppMode {
  cafe,
  burger,
}

KioskMode kioskModeFromAppMode(AppMode mode) {
  switch (mode) {
    case AppMode.burger:
      return KioskMode.burger;
    case AppMode.cafe:
      return KioskMode.cafe;
    default:
      throw ArgumentError('AppMode $mode cannot be converted to KioskMode');
  }
}