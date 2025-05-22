import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart' show TextStyleSet;
import 'package:team_kiosk/core/constants/box_styles.dart';

class TotalAmount extends StatelessWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final String amount;

  const TotalAmount({
    super.key,
    required this.theme,
    required this.textStyleSet,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: AutoSizeText("총 금액", style: textStyleSet.headline2),
          ),
          Flexible(
            flex: 1,
            child: AutoSizeText(
              '${NumberFormat.currency(locale: "ko_KR").format(int.parse(amount)).replaceAll("KRW", '')}원',
              style: textStyleSet.headline2.copyWith(color: theme.primary),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
