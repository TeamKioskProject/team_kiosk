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
            child: Consumer(
              builder: (context, ref, _) {
                final tabController = DefaultTabController.of(context);
                final selectedIndex = tabController?.index ?? 0;

                final appState = ref.watch(appStateProvider);
                final theme = ref.watch(kioskThemeProvider);
                final viewModel = ref.watch(
                  menuSelectNotifierProvider.notifier,
                );

                return appState.mode == AppMode.burger
                    ? StepProgressBar(
                      onTap: (int index) {
                        viewModel.changeMode(
                          appStateMode: appState,
                          index: index,
                        );
                        tabController?.animateTo(index);
                      },
                      titles: ['햄버거', '사이드', '음료', '디저트'],
                      icons: [
                        const Icon(Icons.lunch_dining),
                        Image.asset(
                          'assets/icons/fries.png',
                          width: 24,
                          height: 24,
                          color: selectedIndex == 1 ? theme.primary : null,
                        ),
                        Image.asset(
                          'assets/icons/cola.png',
                          width: 24,
                          height: 30,
                          color: selectedIndex == 2 ? theme.primary : null,
                        ),
                        const Icon(Icons.icecream_rounded),
                      ],
                      theme: theme,
                    )
                    : StepProgressBar(
                      onTap: (int index) {
                        viewModel.changeMode(
                          appStateMode: appState,
                          index: index,
                        );
                        tabController?.animateTo(index);
                      },
                      titles: ['음료', '디저트'],
                      icons: [
                        Icon(
                          Icons.coffee,
                          color: selectedIndex == 0 ? theme.primary : null,
                        ),
                        Icon(
                          Icons.bakery_dining,
                          size: 32,
                          color: selectedIndex == 1 ? theme.primary : null,
                        ),
                      ],
                      theme: theme,
                    );
              },
            ),
          ),
        ),
        body: Container(
          color: theme.background,
          child: state.when(
            data: (menuState) => appState.mode == AppMode.burger
                ? TabBarView(
              children: [
                _buildMenuGrid(menuState.itemList, theme),
                _buildMenuGrid(menuState.itemList, theme),
                _buildMenuGrid(menuState.itemList, theme),
                _buildMenuGrid(menuState.itemList, theme),
              ],
            )
                : TabBarView(
              children: [
                _buildMenuGrid(menuState.itemList, theme),
                _buildMenuGrid(menuState.itemList, theme),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text(
                '오류 발생: $error',
                style: style.body,
              ),
            ),
          ),
        ),
        bottomNavigationBar: MenuBottomBar(theme: theme),
      ),
    );
  }

Widget _buildMenuGrid(
  List<OrderItem> items,
  KioskTheme theme,
  CartNotifier cartViewModel,
) {
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
              },
            );
          },
        ),
      ),
    ),
  );
}
