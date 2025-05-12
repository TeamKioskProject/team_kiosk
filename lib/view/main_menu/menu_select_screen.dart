import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';
import 'package:team_kiosk/data/model/order_item.dart';
import 'package:team_kiosk/view/main_menu/menu_select_notifier.dart';

class MenuSelectScreen extends ConsumerWidget {
  const MenuSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    final appState = ref.read(appStateProvider);
    final style = ref.read(textStyleSetProvider);
    final state = ref.watch(menuSelectNotifierProvider);
    final viewModel = ref.watch(menuSelectNotifierProvider.notifier);

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
            child: appState.mode == AppMode.burger
                ? StepProgressBar(
              onTap: (index) {
                viewModel.changeMode(index: index);
              },
              titles: ['햄버거', '사이드', '음료', '디저트'],
              icons: List.generate(4, (index) => Icons.lunch_dining),
              theme: theme,
            )
                : StepProgressBar(
              onTap: (index) {
                viewModel.changeMode(index: index);
              },
              titles: ['음료', '디저트'],
              icons: List.generate(2, (index) => Icons.lunch_dining),
              theme: theme,
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
      ),
    );
  }

  Widget _buildMenuGrid(List<OrderItem> items, KioskTheme theme) {
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
                  // TODO: 선택 동작 처리
                },
              );
            },
          ),
        ),
      ),
    );
  }
}