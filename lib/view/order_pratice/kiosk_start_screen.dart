import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bartton.dart';

class KioskStartScreen extends ConsumerWidget {
  const KioskStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KioskAppBar(
        title: '키오스크 연습',
        theme: KioskTheme.fromMode(KioskMode.burger),
        action: const [Icon(Icons.volume_up)],
      ),
      body: Column(),
    );
  }
}
