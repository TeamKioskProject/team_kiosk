import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/view/payment/payment_state.dart';

class PaymentNotifier extends Notifier<PaymentState> {
  @override
  PaymentState build() => const PaymentState();

  void changeMethode({required String value}) {
    state = state.copyWith(selectMethode: value);
  }
}

final paymentNotifierProvider = NotifierProvider<PaymentNotifier, PaymentState>(
  () => PaymentNotifier(),
);
