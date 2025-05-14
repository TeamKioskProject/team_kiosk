import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/view/menu_set_select/set_select_state.dart';

class SetSelectNotifier extends Notifier<SetSelectState> {
  @override
  SetSelectState build() => const SetSelectState();

  void isSetChange({required bool change}) {
    state = state.copyWith(isSetBool: change);
  }
}

final setSelectProvider = NotifierProvider<SetSelectNotifier, SetSelectState>(
  () => SetSelectNotifier(),
);
