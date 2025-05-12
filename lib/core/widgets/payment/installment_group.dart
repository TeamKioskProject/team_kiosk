import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';

class InstallmentGroup extends StatelessWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  const InstallmentGroup({
    super.key,
    required this.theme,
    required this.textStyleSet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('할부로 결제 하시겠어요?', style: textStyleSet.headline2),
          const SizedBox(
            height: 20,
          ),
          GroupButton<String>(
            buttons: [
              '3개월',
              '6개월',
              '일시불'
            ],
            buttonBuilder: (select, text, context) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.primary),
                  color:  select ? theme.primary : Colors.white
                ),
                child: Text(text, style: textStyleSet.button.copyWith(color:select ? Colors.white : theme.primary),),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
