import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/payment/payment_method_tile.dart';
import 'package:team_kiosk/core/widgets/payment/total_amount.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';
import 'package:team_kiosk/view/payment/payment_notifier.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    final textStyles = ref.watch(textStyleSetProvider);
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);
    final paymentState = ref.watch(paymentNotifierProvider);
    final paymentNotifier = ref.watch(paymentNotifierProvider.notifier);
    return Scaffold(
      appBar: KioskAppBar(title: '결제하기', theme: theme),
      backgroundColor: theme.background,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: KioskButton(
              text: '결제 방법을 선택해주세요',
              theme: theme,
              category:
                  theme == KioskTheme.fromMode(KioskMode.burger)
                      ? kiosk.Category.burger
                      : kiosk.Category.cafe,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        paymentNotifier.changeMethode(value: '카드 결제');
                      },
                      child: PaymentMethodTile(
                        paymentName: '카드 결제',
                        theme: theme,
                        textStyleSet: textStyles,
                        state: paymentState.selectMethode == '카드 결제',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
            
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        paymentNotifier.changeMethode(value: '페이 결제');
                      },
                      child: PaymentMethodTile(
                        paymentName: '페이 결제',
                        theme: theme,
                        textStyleSet: textStyles,
                        state: paymentState.selectMethode == '페이 결제',
                      ),
                    ),
                  ),
                ],
              ),
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
          const Expanded(child: SizedBox(
            child: Center(
              child: Text('실제 결제가 이루어지지 않는 연습용입니다'),
            ),
          )),
          Semantics(
            button: true,
            label: '',
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: CategoryCard(
                icon: Icons.credit_card,
                category: theme == KioskTheme.fromMode(KioskMode.burger) ? Category.burger : Category.cafe,
                theme: theme,
                text: '다음으로',
                onTap: () {
                  if(paymentState.selectMethode != '') {
                    context.go("/installment");
                  }
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
