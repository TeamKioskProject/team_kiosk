
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  final String selectMethode;

  const PaymentState({
     this.selectMethode = '',
  });
}
