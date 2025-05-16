import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';

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
          // 결제 완료 애니메이션
          Flexible(
            flex: 3,
            child: Center(
              child: Semantics(
                label: '결제가 완료되었습니다',
                child: Lottie.asset('assets/lottie/payment_animation.json'),
              ),
            ),
          ),

          // 결제 완료 메시지
          Semantics(
            label: '결제가 완료되었습니다',
            child: Text('결제가 완료되었습니다!', style: textStyles.headline2),
          ),

          Expanded(child: Container()),

          // 처음으로 버튼
          Semantics(
            button: true,
            label: '진동벨 번호 확인 버튼',
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: CategoryCard(
                icon: Icons.arrow_forward,
                category:
                    theme == KioskTheme.fromMode(KioskMode.burger)
                        ? Category.burger
                        : Category.cafe,
                theme: theme,
                text: '진동벨 번호 확인',
                onTap: () {
                  context.go('/order-complete-screen');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
