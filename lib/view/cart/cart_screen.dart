import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/payment/order_summary_box.dart';
import 'package:team_kiosk/core/widgets/payment/total_amount.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';


class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.read(kioskThemeProvider);
    final textStyles = ref.read(textStyleSetProvider);
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);

    return Scaffold(
      appBar: KioskAppBar(title: '장바구니', theme: theme, textStyleSet: textStyles,),
      backgroundColor: theme.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // 총 금액
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Semantics(
                label: '총 금액 ${cartState.totalAmount}원',
                child: TotalAmount(
                  theme: theme,
                  textStyleSet: textStyles,
                  amount: cartState.totalAmount.toString(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 빈 장바구니 상태
            if (cartState.cartItems.isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Semantics(
                      label: theme == KioskTheme.fromMode(KioskMode.burger)
                          ? "버거 장바구니 비어 있음"
                          : "커피 장바구니 비어 있음",
                      child: Lottie.asset(
                        theme == KioskTheme.fromMode(KioskMode.burger)
                            ? "assets/lottie/hambuger_lottie.json"
                            : "assets/lottie/coffe_lottie.json",
                      ),
                    ),
                    Semantics(
                      label: '장바구니에 담은 상품이 없습니다',
                      child: Text('장바구니에 담은 상품이 없습니다', style: textStyles.body),
                    ),
                  ],
                ),
              ),

            // 장바구니에 상품이 있는 경우
            if (cartState.cartItems.isNotEmpty)
              Expanded(
                child: ListView(
                  children: cartState.cartItems.map((items) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Semantics(
                        label:
                        '${items.name}, 가격 ${items.price}원, 수량 ${items.quantity}개',
                        child: OrderSummaryBox(
                          theme: theme,
                          textStyleSet: textStyles,
                          itemName: items.name,
                          itemPrice: items.price.toString(),
                          itemImage: items.imagePath,
                          itemQuantity: items.quantity,
                          itemId: items.id,
                          onAddTap: (id) {
                            cartNotifier.incrementQuantity(id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${items.name}의 수량이 증가했습니다.'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          onMinusTap: (id) {
                            cartNotifier.decrementQuantity(id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${items.name}의 수량이 감소했습니다.'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            // 결제 버튼
            if (cartState.cartItems.isNotEmpty)
              Semantics(
                button: true,
                label: '결제하러 가기 버튼',
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: CategoryCard(
                    icon: Icons.credit_card,
                    category: Category.burger,
                    theme: theme,
                    text: '결제하러가기',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('결제 화면으로 이동합니다.'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
