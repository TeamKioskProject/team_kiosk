import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/selectable_tile.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_action_button.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_cancel_button.dart';
import 'package:team_kiosk/core/widgets/payment/installment_group.dart';
import 'package:team_kiosk/core/widgets/payment/payment_method_tile.dart';
import 'package:team_kiosk/core/widgets/payment/signature_card.dart';
import 'package:team_kiosk/core/widgets/payment/total_amount.dart';

void main() {
  final theme = KioskTheme.fromMode(KioskMode.cafe);

  final testWidgetsMap = <String, Widget>{
    'DialogActionButton': DialogActionButton(
      theme: theme,
      text: '확인',
      textStyleSet: AppTextStyles.normal,
      onTapEvent: () => dev.log('DialogActionButton pressed!'),
    ),
    'PaymentMethodTile': PaymentMethodTile(
      theme: theme,
      paymentName: '신용카드',
      textStyleSet: AppTextStyles.normal,
    ),
    'DialogCancelButton': DialogCancelButton(
      theme: theme,
      text: '취소',
      textStyleSet: AppTextStyles.normal,
      onTapEvent: () => dev.log('DialogCancelButton pressed!'),
    ),
    'SelectableTile': ProviderScope(
      child: SelectableTile(
        image: 'assets/images/hamburger.png',
        title: '커피',
        icon: Icons.local_cafe,
        theme: theme,
        onTap: () => dev.log('SelectableTile tapped!'),
        textStyleSet: AppTextStyles.normal,
      ),
    ),
    'Kioskbutton': ProviderScope(
      child: Kioskbutton(
        text: '주문하기',
        theme: theme,
        textStyleSet: AppTextStyles.normal,
      ),
    ),
    'CategoryCard': ProviderScope(
      child: CategoryCard(
        theme: theme,
        text: '카페',
        category: Category.cafe,
        onTap: () => dev.log('CategoryCard tapped!'),
        icon: Icons.handyman_sharp,
        textStyleSet: AppTextStyles.normal,
      ),
    ),
    'SignatureCard': SignatureCard(styles: AppTextStyles.normal, theme: theme),
    'TotalAmount' : TotalAmount(theme: theme, textStyleSet: AppTextStyles.normal, amount: '25800'),
    'InstallmentGroup' : InstallmentGroup(theme: theme, textStyleSet: AppTextStyles.normal)
  };

  final screenSizes = [
    const Size(320, 640), // iPhone SE (small)
    const Size(375, 812), // iPhone 13 (medium)
    const Size(414, 896), // iPhone 11 Pro Max (large)
    const Size(768, 1024), // iPad (tablet)
    const Size(1080, 1920), // FHD (large screen)
  ];

  for (final entry in testWidgetsMap.entries) {
    for (final size in screenSizes) {
      final screenName =
          "${entry.key}_${size.width.toInt()}x${size.height.toInt()}";

      testWidgets("$screenName golden test", (tester) async {
        final pretendard = rootBundle.load(
          'assets/fonts/Pretendard-Medium.ttf',
        );
        final fontLoader = FontLoader('Pretendard')..addFont(pretendard);
        await fontLoader.load();

        // Set the view size
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              fontFamily: 'Pretendard',
              textTheme: AppTextStyles.normal.toTextTheme(),
            ),
            home: entry.value,
          ),
        );

        await expectLater(
          find.byType(entry.value.runtimeType),
          matchesGoldenFile("goldens/$screenName.png"),
        );

        // Reset the view size
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
    }
  }
}
