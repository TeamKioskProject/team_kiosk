import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/view/cart/cart_screen.dart';
import 'package:team_kiosk/view/home_screen.dart';
import 'package:team_kiosk/view/ingredinet_select/ingredient_selector.dart';
import 'package:team_kiosk/view/installment_select/installment_screen.dart';
import 'package:team_kiosk/view/kiosk_start_page/kiosk_start_page.dart';
import 'package:team_kiosk/view/main_menu/menu_select_screen.dart';
import 'package:team_kiosk/view/menu_set_select/set_select_screen.dart';
import 'package:team_kiosk/view/payment/payment_screen.dart';
import 'package:team_kiosk/view/payment/payment_success_screen.dart';
import 'package:team_kiosk/view/place_select/place_select_screen.dart';
import 'package:team_kiosk/view/set_builder/set_builder_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/kiosk-start-page',
      builder: (context, state) => const KioskStartPage(),
    ),
    GoRoute(
      path: '/place-select-screen',
      builder: (context, state) => const PlaceSelectScreen(),
    ),
    GoRoute(
      path: '/menu-select-screen',
      builder: (context, state) => const MenuSelectScreen(),
    ),
    GoRoute(
      path: '/set-select-screen',
      builder:
          (context, state) =>
              SetSelectScreen(menuData: state.extra as MenuCard),
    ),
    GoRoute(
      path: '/ingredient-select',
      builder: (context, state) => IngredientSelector(imageUri: state.extra as String)),
    GoRoute(
        path: '/set-builder',
        builder: (context, state) => SetBuilderScreen(menuCard: state.extra as MenuCard,)),
    GoRoute(
      path: '/installment',
      builder: (context, state) => const InstallmentScreen(),
    ),
    GoRoute(
      path: '/payment-success',
      builder: (context, state) => const PaymentSuccessScreen(),
    ),
  ],
);
