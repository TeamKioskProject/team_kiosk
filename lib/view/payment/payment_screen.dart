import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/payment/payment_method_tile.dart';
import 'package:team_kiosk/core/widgets/payment/total_amount.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final textStyles = ref.read(textStyleSetProvider);
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);
    return Scaffold(
      appBar: KioskAppBar(title: '결제하기', theme: theme),
      backgroundColor: theme.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Kioskbutton(text: '결제 방법을 선택해주세요', theme: theme),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: PaymentMethodTile(
                    paymentName: '카드 결제',
                    theme: theme,
                    textStyleSet: textStyles,
                  ),
                ),
                const SizedBox(width: 20),

                Expanded(
                  child: PaymentMethodTile(
                    paymentName: '페이 결제',
                    theme: theme,
                    textStyleSet: textStyles,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TotalAmount(
              theme: theme,
              textStyleSet: textStyles,
              amount: cartState.totalAmount.toString(),
            ),
          ),
          const Expanded(child: SizedBox()),
          Semantics(
            button: true,
            label: '',
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: CategoryCard(
                icon: Icons.credit_card,
                category: Category.burger,
                theme: theme,
                text: '다음으로',
                onTap: () {
                  // context.push("/payment");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
