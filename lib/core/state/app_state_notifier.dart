import 'package:riverpod/riverpod.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state.dart';

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() =>
      const AppState(isBarrierFree: false, mode: AppMode.burger);

  void toggleBarrierFree() {
    state = state.copyWith(isBarrierFree: !state.isBarrierFree);
  }

  void setBarrierFree(bool enabled) {
    state = state.copyWith(isBarrierFree: enabled);
  }

  void changeMode(AppMode newMode) {
    state = state.copyWith(mode: newMode);
  }
}
