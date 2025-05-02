import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class AppScaffold extends ConsumerWidget {
  final String? title;
  final Widget child;

  const AppScaffold({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);

    return Scaffold(
      body: SafeArea(child: DefaultTextStyle(style: styles.body, child: child)),
    );
  }
}
