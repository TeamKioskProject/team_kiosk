import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/payment/mock_data.dart';
import 'package:team_kiosk/core/widgets/payment/order_summary_box.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    final styles = ref.watch(textStyleSetProvider);

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Kioskbutton(text: '오늘은 몇가지 주문을 해볼까요?', theme: theme, textStyleSet: styles),
            const SizedBox(height: 24),
            Column(
              children:
                  mockData.map((items) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OrderSummaryBox(
                        theme: theme,
                        textStyleSet: styles,
                        itemImage: items["menuImgThumPath"],
                        itemName: items["menuNm"],
                        itemPrice: items["price"].toString(),
                        itemQuantity: 1,
                      ),
                    );
                  }).toList(),
            ),
            

            Column(
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
          ],
        ),
      ),
    );
  }
}
