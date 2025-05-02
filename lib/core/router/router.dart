import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/app_scaffold.dart';
import 'package:team_kiosk/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(title: 'Kiosk Demo', child: child);
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) =>  HomeScreen()),
        ],
      ),
    ],
  );
});
