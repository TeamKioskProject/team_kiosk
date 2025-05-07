import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';

class PaymentMethodTile extends StatelessWidget {
  final KioskTheme theme;
  final String paymentName;
  final TextStyleSet textStyleSet;

  const PaymentMethodTile({
    super.key,
    required this.paymentName,
    required this.theme,
    required this.textStyleSet,
  });

  @override
  Widget build(BuildContext context) {
    final IconData icon = paymentName == '카드 결제'
        ? Icons.credit_card
        : Icons.smartphone;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: theme.primary),
          const SizedBox(height: 20),
          Text(paymentName, style: textStyleSet.headline2),
        ],
      ),
    );
  }
}