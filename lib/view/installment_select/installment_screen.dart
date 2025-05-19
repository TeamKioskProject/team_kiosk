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
    final totalAmount = cartState.totalAmount;
    final requiresSignature = totalAmount >= 50000;

    return Scaffold(
      appBar: KioskAppBar(title: '결제하기', theme: theme),
      backgroundColor: theme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
        
            // 총 결제 금액
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Semantics(
                label: '총 결제 금액 ${totalAmount}원',
                child: TotalAmount(
                  theme: theme,
                  textStyleSet: textStyles,
                  amount: totalAmount.toString(),
                ),
              ),
            ),
        
            const SizedBox(height: 24),
        
            // 할부 선택
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Semantics(
                label: '할부 선택 옵션',
                child: InstallmentGroup(theme: theme, textStyleSet: textStyles),
              ),
            ),
        
            const SizedBox(height: 24),
        
            // 서명 여부
            if (requiresSignature)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Semantics(
                  label: '결제 금액이 5만원 이상으로 서명이 필요합니다',
                  child: SignatureCard(theme: theme, styles: textStyles),
                ),
              ),
            if (!requiresSignature)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Semantics(
                    label: '5만원 미만은 서명이 필요하지 않습니다',
                    child: Text(
                      "5만원 미만은 무서명입니다",
                      style: textStyles.headline2,
                    ),
                  ),
                ),
              ),
        
            // 버튼 그룹
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Semantics(
                      button: true,
                      label: '결제 취소 버튼',
                      child: DialogCancelButton(
                        text: '취소하기',
                        onTapEvent: () {
                          context.go("/cart");
                        },
                        theme: theme,
                        textStyleSet: textStyles,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Semantics(
                      button: true,
                      label: '결제하기 버튼',
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
