import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_kiosk/core/state/app_mode.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required AppMode mode,
    required bool isBarrierFree,
  }) = _AppState;

  factory AppState.initial() => const AppState(
    mode: AppMode.cafe,
    isBarrierFree: false,
  );
}