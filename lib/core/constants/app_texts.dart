import 'package:flutter/material.dart';

/// 텍스트 스타일 묶음
class TextStyleSet {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle body;
  final TextStyle button;
  final TextStyle accent;
  final TextStyle caption;

  const TextStyleSet({
    required this.headline1,
    required this.headline2,
    required this.body,
    required this.button,
    required this.accent,
    required this.caption,
  });

  /// TextTheme으로 변환
  TextTheme toTextTheme() {
    return TextTheme(
      headlineLarge: headline1,
      headlineMedium: headline2,
      bodyLarge: body,
      labelLarge: button,
      titleMedium: accent,
      bodySmall: caption,
    );
  }
}

/// Pretendard 폰트 설정
class AppTextStyles {
  static const String _fontFamily = 'Pretendard';

  /// 일반 모드 스타일
  static final TextStyleSet normal = const TextStyleSet(
    headline1: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      height: 1.4,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.4,
      color: Colors.black,
    ),
    body: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: Colors.black87,
    ),
    button: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: Colors.white,
    ),
    accent: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.deepOrange,
    ),
    caption: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      height: 1.4,
    ),
  );

  /// 배리어프리 모드 스타일
  static final TextStyleSet accessible = const TextStyleSet(
    headline1: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 38,
      fontWeight: FontWeight.bold,
      height: 1.4,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.4,
      color: Colors.black,
    ),
    body: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.6,
      color: Colors.black,
    ),
    button: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.3,
      color: Colors.white,
    ),
    accent: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.redAccent,
    ),
    caption: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
      height: 1.5,
    ),
  );

  /// 접근성 모드 여부에 따라 스타일 반환
  static TextStyleSet of(bool isAccessible) {
    return isAccessible ? accessible : normal;
  }
}
