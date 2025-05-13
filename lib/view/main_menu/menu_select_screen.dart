import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_bottom_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';
import 'package:team_kiosk/data/mapper/order_to_cart_mapper.dart';
import 'package:team_kiosk/data/model/order_item.dart';
import 'package:team_kiosk/view/cart/cart_notifier.dart';
import 'package:team_kiosk/view/main_menu/menu_select_notifier.dart';

class MenuSelectScreen extends ConsumerWidget {
  const MenuSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    final appState = ref.watch(appStateProvider);
    final style = ref.watch(textStyleSetProvider);
    final state = ref.watch(menuSelectNotifierProvider);
    final viewModel = ref.watch(menuSelectNotifierProvider.notifier);
    final cartViewModel = ref.watch(cartNotifierProvider.notifier);

    Widget buildMenuGrid(List<OrderItem> items, KioskTheme theme) {
      return SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return MenuCard(
                  image: item.imageUrl,
                  title: item.name,
                  price: item.price,
                  theme: theme,
                  onTap: () {
                    final cartItem = item.toCart();
                    cartViewModel.addItem(cartItem);
                    print(cartItem);
                  },
                );
              },
            ),
          ),
        ),
      );
    }

    return DefaultTabController(
      length: appState.mode == AppMode.burger ? 4 : 2,
      child: Scaffold(
        appBar: KioskAppBar(
          title: '메뉴 선택',
          theme: theme,
          action: [
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.volume_up),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child:
                appState.mode == AppMode.burger
                    ? StepProgressBar(
                      onTap: (int) {
                        viewModel.changeMode(
                          appStateMode: appState,
                          index: int,
                        );
                      },
                      titles: ['햄버거', '사이드', '음료', '디저트'],
                      icons: List.generate(4, (index) => Icons.lunch_dining),
                      theme: theme,
                    )
                    : StepProgressBar(
                      onTap: (int) {
                        viewModel.changeMode(
                          appStateMode: appState,
                          index: int,
                        );
                      },
                      titles: ['음료', '디저트'],
                      icons: List.generate(2, (index) => Icons.lunch_dining),
                      theme: theme,
                    ),
          ),
        ),
        body: Container(
          color: theme.background,
          child:
              appState.mode == AppMode.burger
                  ? TabBarView(
                    children: [
                      buildMenuGrid(state.itemList, theme),
                      buildMenuGrid(state.itemList, theme),
                      buildMenuGrid(state.itemList, theme),
                      buildMenuGrid(state.itemList, theme),
                    ],
                  )
                  : TabBarView(
                    children: [
                      buildMenuGrid(state.itemList, theme),
                      buildMenuGrid(state.itemList, theme),
                    ],
                  ),
        ),
        bottomNavigationBar: MenuBottomBar(
          theme: theme,
          onTap: () {
            context.push('/cart');
          },
        ),
      ),
    );
  }
}
