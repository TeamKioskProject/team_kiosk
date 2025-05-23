
import 'package:freezed_annotation/freezed_annotation.dart';
part 'set_select_state.freezed.dart';

@freezed
class SetSelectState with _$SetSelectState {
  final bool? isSetBool;

  const SetSelectState({
    this.isSetBool = null
  });
}
