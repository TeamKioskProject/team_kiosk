import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class OrderSummaryBox extends ConsumerWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final int itemQuantity;

  const OrderSummaryBox({
    required this.theme,
    required this.textStyleSet,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemQuantity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow:const [
          BoxShadow(
            color: Color(0x1A000000), // 000000 with 10% opacity
            offset: Offset(0, 2), // X: 0, Y: 2
            blurRadius: 4, // Blur: 4
            spreadRadius: 0, // Spread: 0
          ),
        ],
      ),
    );
  }
}
