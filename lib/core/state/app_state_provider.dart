import 'package:riverpod/riverpod.dart';
import 'package:team_kiosk/core/state/app_state.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((
  ref,
) {
  return AppStateNotifier();
});
