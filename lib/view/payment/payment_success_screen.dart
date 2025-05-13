import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';

class PaymentSuccessScreen extends ConsumerWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final textStyles = ref.read(textStyleSetProvider);
    return Scaffold(
      backgroundColor: theme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Center(
              child: Lottie.asset('assets/lottie/payment_animation.json'),
            ),
          ),
          Text('결제가 완료 되었습니다!', style: textStyles.headline2),
          Expanded(child: Container()),
          Semantics(
            button: true,
            label: '',
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: CategoryCard(
                icon: Icons.refresh,
                category: theme == KioskTheme.fromMode(KioskMode.burger) ? Category.burger : Category.cafe,
                theme: theme,
                text: '처음으로',
                onTap: () {
                  context.go('/');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
