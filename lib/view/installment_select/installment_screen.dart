import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_action_button.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_cancel_button.dart';
import 'package:team_kiosk/core/widgets/payment/installment_group.dart';
import 'package:team_kiosk/core/widgets/payment/signature_card.dart';
import 'package:team_kiosk/core/widgets/payment/total_amount.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';

class InstallmentScreen extends ConsumerWidget {
  const InstallmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final textStyles = ref.read(textStyleSetProvider);
    final cartState = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: KioskAppBar(title: '결제하기', theme: theme),
      backgroundColor: theme.background,
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TotalAmount(
              theme: theme,
              textStyleSet: textStyles,
              amount: cartState.totalAmount.toString(),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InstallmentGroup(theme: theme, textStyleSet: textStyles),
          ),
          const SizedBox(height: 24),
          if (cartState.totalAmount >= 50000)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SignatureCard(theme: theme, styles: textStyles),
            ),
          if (cartState.totalAmount < 50000)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "5만원 미만은 무서명 입니다",
                    style: textStyles.headline2,
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: DialogCancelButton(
                    text: '취소하기',
                    onTapEvent: () {
                      context.go("/cart");
                    },
                    theme: theme,
                    textStyleSet: textStyles,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: DialogActionButton(
                    text: '결제하기',
                    onTapEvent: () async {
                      await Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          context.go('/payment-success');
                        },
                      );
                    },
                    theme: theme,
                    textStyleSet: textStyles,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
