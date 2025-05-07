import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_action_button.dart';
import 'package:team_kiosk/core/widgets/payment/payment_method_tile.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_cancel_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/selectable_tile.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_button.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final theme = KioskTheme.fromMode(KioskMode.cafe);

  final testWidgetsMap = <String, Widget>{
    // ✅ DialogActionButton
    'DialogActionButton': DialogActionButton(
      theme: theme,
      text: '확인',
      textStyleSet: AppTextStyles.accessible,
      onTapEvent: () => print('DialogActionButton pressed!'),
    ),

    // ✅ PaymentMethodTile
    'PaymentMethodTile': PaymentMethodTile(
      theme: theme,
      paymentName: '신용카드',
      textStyleSet: AppTextStyles.accessible,
    ),

    // ✅ DialogCancelButton
    'DialogCancelButton': DialogCancelButton(
      theme: theme,
      text: '취소',
      textStyleSet: AppTextStyles.accessible,
      onTapEvent: () => print('DialogCancelButton pressed!'),
    ),

    // ✅ SelectableTile (ProviderScope 포함)
    'SelectableTile': ProviderScope(
      child: SelectableTile(
        image: 'assets/images/hamburger.png',
        title: '커피',
        icon: Icons.local_cafe,
        theme: theme,
        onTap: () => print('SelectableTile tapped!'),
      ),
    ),

    // ✅ Kioskbutton (ProviderScope 포함)
    'Kioskbutton': ProviderScope(
      child: Kioskbutton(
        text: '주문하기',
        theme: theme,
      ),
    ),

    // ✅ CategoryCard (ProviderScope 포함)
    'CategoryCard': ProviderScope(
      child: CategoryCard(
        theme: theme,
        text: '카페',
        category: Category.cafe,
        onTap: () => print('CategoryCard tapped!'),
        icon: Icons.handyman_sharp,
      ),
    ),
  };

  for (final entry in testWidgetsMap.entries) {
    testWidgets("${entry.key} golden test", (tester) async {
      await tester.pumpWidget(MaterialApp(home: entry.value));
      await expectLater(
        find.byType(entry.value.runtimeType),
        matchesGoldenFile("goldens/${entry.key}.png"),
      );
    });
  }
}