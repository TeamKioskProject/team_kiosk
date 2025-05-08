import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';

void main() {
  final theme = KioskTheme.fromMode(KioskMode.cafe);

  final testWidgetsMap = <String, Widget>{};

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
