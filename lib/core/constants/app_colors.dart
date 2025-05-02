import 'package:flutter/material.dart';

/// 테마 모드 enum
enum KioskMode { burger, cafe }

/// 색상 정의
class AppColors {
  // 햄버거 주문용 테마
  static const burgerPrimary = Color(0xFFFF5722); // Deep Orange
  static const burgerSecondary = Color(0xFFFF9800); // Orange
  static const burgerBackground = Color(0xFFFFF3E0); // Light Cream
  static const burgerSurface = Color(0xFFFFFFFF); // White
  static const burgerText = Color(0xFF212121); // Dark Grey
  static const burgerSubText = Color(0xFF757575); // Grey

  // 카페(스타벅스 스타일) 테마
  static const cafePrimary = Color(0xFF00704A); // Starbucks Green
  static const cafeSecondary = Color(0xFFCBA135); // Rich Gold
  static const cafeBackground = Color(0xFFF2F0EB); // Warm Cream
  static const cafeSurface = Color(0xFFFFFFFF); // White
  static const cafeText = Color(0xFF2E2E2E); // Dark Grey
  static const cafeAccent = Color(0xFFA4C3B2); // Soft Mint
}

/// 키오스크 테마
class KioskTheme {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color text;
  final Color subText;

  /// enum 기반 팩토리 생성자
  factory KioskTheme.fromMode(KioskMode mode) {
    switch (mode) {
      case KioskMode.burger:
        return const KioskTheme._(
          primary: AppColors.burgerPrimary,
          secondary: AppColors.burgerSecondary,
          background: AppColors.burgerBackground,
          surface: AppColors.burgerSurface,
          text: AppColors.burgerText,
          subText: AppColors.burgerSubText,
        );
      case KioskMode.cafe:
        return const KioskTheme._(
          primary: AppColors.cafePrimary,
          secondary: AppColors.cafeSecondary,
          background: AppColors.cafeBackground,
          surface: AppColors.cafeSurface,
          text: AppColors.cafeText,
          subText: AppColors.cafeAccent,
        );
    }
  }

  const KioskTheme._({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.text,
    required this.subText,
  });
}