import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';

class BurgerCard extends StatelessWidget {
  final String name;
  final String price;
  final Widget? image;
  final TextStyleSet textStyleSet;
  final KioskTheme theme;

  const BurgerCard({
    Key? key,
    required this.name,
    required this.price,
    required this.textStyleSet,
    required this.theme,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Row(
        children: [
          image ?? const Center(child: Text("IMG")),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: textStyleSet.body,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: textStyleSet.caption.copyWith(color: theme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}