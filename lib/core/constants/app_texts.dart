import 'package:flutter/material.dart';

class AppTextStyles {
  /// 일반 모드 (Pretendard, 표준 크기)
  static const normal = _TextStyleSet(
    fontFamily: 'Pretendard',
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1.4, color: Colors.black),
    headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.4, color: Colors.black),
    body: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.5, color: Colors.black87),
    button: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.2, color: Colors.white),
    accent: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.deepOrange),
    caption: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey, height: 1.4),
  );

  /// 배리어프리 모드 (크기 + 대비 강화)
  static const accessible = _TextStyleSet(
    fontFamily: 'Pretendard',
    headline1: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, height: 1.4, color: Colors.black),
    headline2: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.4, color: Colors.black),
    body: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 1.6, color: Colors.black),
    button: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.3, color: Colors.white),
    accent: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.redAccent),
    caption: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54, height: 1.5),
  );
}

class _TextStyleSet {
  final String fontFamily;
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle body;
  final TextStyle button;
  final TextStyle accent;
  final TextStyle caption;

  const _TextStyleSet({
    required this.fontFamily,
    required this.headline1,
    required this.headline2,
    required this.body,
    required this.button,
    required this.accent,
    required this.caption,
  });
}