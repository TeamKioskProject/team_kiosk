import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/payment/mock_data.dart';
import 'package:team_kiosk/core/widgets/payment/order_summary_box.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final theme = ref.watch(kioskThemeProvider);
    final styles = ref.watch(textStyleSetProvider);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children:
            mockData.map((items) {
              return OrderSummaryBox(
                theme: theme,
                textStyleSet: styles,
                itemImage: items["menuImgThumPath"],
                itemName: items["menuNm"],
                itemPrice: items["price"].toString(),
                itemQuantity: 1,
              );
            }).toList(),
      ),
    );
  }
}
