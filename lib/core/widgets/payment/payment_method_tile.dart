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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Column(
        spacing: 20,
        children: [
          if (paymentName == '카드 결제')
            Icon(Icons.credit_card, size: 48, color: theme.primary),
          if (paymentName != '카드 결제')
            Icon(Icons.smartphone, size: 48, color: theme.primary),
          Text(paymentName, style: textStyleSet.headline2),
        ],
      ),
    );
  }
}
