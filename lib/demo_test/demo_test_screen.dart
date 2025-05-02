import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_provider.dart';
import 'package:team_kiosk/demo_test/app_scaffold.dart';

class DemoTestScreen extends ConsumerWidget {
  const DemoTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appStateProvider.notifier);

    return AppScaffold(
      title: 'DemoTestScreen',
      builder: (context, theme, styles) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ✅ 테마 전환 버튼
              Text('🧾 테마 변경', style: styles.headline2),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => notifier.changeMode(AppMode.burger),
                style: ElevatedButton.styleFrom(backgroundColor: theme.primary),
                child: Text('🍔 햄버거 테마로 변경', style: styles.button),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => notifier.changeMode(AppMode.cafe),
                style: ElevatedButton.styleFrom(backgroundColor: theme.primary),
                child: Text('☕ 카페 테마로 변경', style: styles.button),
              ),

              const Divider(height: 32),

              // ✅ 배리어 프리 토글
              Text('🧩 배리어프리 모드', style: styles.headline2),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => notifier.setBarrierFree(true),
                child: Text('🔊 배리어프리 ON', style: styles.button),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => notifier.setBarrierFree(false),
                child: Text('🔇 배리어프리 OFF', style: styles.button),
              ),

              const Divider(height: 32),

              // ✅ 테마 색상 미리보기
              Text('🎨 테마 색상 미리보기', style: styles.headline2),
              const SizedBox(height: 8),
              _buildColorBox('Primary', theme.primary),
              _buildColorBox('Secondary', theme.secondary),
              _buildColorBox('Background', theme.background),
              _buildColorBox('Surface', theme.surface),
              _buildColorBox('Text', theme.text),
              _buildColorBox('SubText', theme.subText),

              const Divider(height: 32),

              // ✅ 텍스트 스타일 미리보기
              Text('✍️ 텍스트 스타일 미리보기', style: styles.headline2),
              const SizedBox(height: 8),
              Text('Headline1 스타일입니다', style: styles.headline1),
              const SizedBox(height: 8),
              Text('Headline2 스타일입니다', style: styles.headline2),
              const SizedBox(height: 8),
              Text('본문 Body 텍스트입니다.', style: styles.body),
              const SizedBox(height: 8),
              Text('강조 텍스트 (Accent)', style: styles.accent),
              const SizedBox(height: 8),
              Text('캡션 텍스트입니다.', style: styles.caption),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => notifier.toggleBarrierFree(),
                style: ElevatedButton.styleFrom(backgroundColor: theme.primary),
                child: Text('버튼 스타일 예시', style: styles.button),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildColorBox(String label, Color color) {
    final textColor = ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Container(
      width: double.infinity,
      height: 60,
      color: color,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}