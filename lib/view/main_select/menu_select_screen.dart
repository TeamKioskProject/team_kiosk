import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_bottom_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';
import 'package:team_kiosk/data/model/burger.dart';
import 'package:team_kiosk/view/main_select/burger_provider/burger_provider.dart';
import 'package:team_kiosk/view/main_select/cafe_provider/cafe_provider.dart';

class MenuSelectScreen extends ConsumerWidget {
  const MenuSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final style = ref.read(textStyleSetProvider);
    final appState = ref.watch(appStateProvider);
    final burgerListAsync = ref.watch(burgerListProvider);
    final dessertAsync = ref.watch(dessertListProvider);
    final drinkAsync = ref.watch(drinkListProvider);
    final sideAsync = ref.watch(sideListProvider);
    final cafeDessertAsync = ref.watch(cafeDessertListProvider);
    final cafeDrinkAsync = ref.watch(cafeDrinkListProvider);
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
            child: StepProgressBar(
              appState.mode == AppMode.burger ? '햄버거' : '디저트',
              appState.mode == AppMode.burger
                  ? Icons.lunch_dining
                  : Icons.icecream_rounded,
              '디저트',
              Icons.icecream_rounded,
              title3: appState.mode == AppMode.burger ? '음료수' : null,
              icon3: appState.mode == AppMode.burger ? Icons.sports_bar : null,
              title4: appState.mode == AppMode.burger ? '사이드' : null,
              icon4: appState.mode == AppMode.burger ? Icons.cookie : null,
              theme: theme,
            ),
          ),
        ),
        body: Container(
          color: theme.background,
          child: TabBarView(
            children:
                appState.mode == AppMode.burger
                    ? [
                      // Step 1 - 햄버거
                      burgerListAsync.when(
                        data: (burgerList) => _buildMenuGrid(burgerList, theme),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('오류 발생: $error')),
                      ),
                      // Step 2 - 디저트
                      dessertAsync.when(
                        data:
                            (dessertList) => _buildMenuGrid(dessertList, theme),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('오류 발생: $error')),
                      ),
                      // Step 3 - 음료
                      drinkAsync.when(
                        data: (drinkList) => _buildMenuGrid(drinkList, theme),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('오류 발생: $error')),
                      ),
                      // Step 4 - 사이드
                      sideAsync.when(
                        data: (sideList) => _buildMenuGrid(sideList, theme),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('오류 발생: $error')),
                      ),
                    ]
                    : [
                      // Step 1 - 디저트
                      cafeDessertAsync.when(
                        data:
                            (cafeDessertList) =>
                                _buildMenuGrid(cafeDessertList, theme),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('오류 발생: $error')),
                      ),
                      // Step 2 - 음료
                      cafeDrinkAsync.when(
                        data: (drinkList) => _buildMenuGrid(drinkList, theme),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (error, stack) =>
                                Center(child: Text('오류 발생: $error')),
                      ),
                    ],
          ),
        ),

        bottomNavigationBar: MenuBottomBar(theme: theme),
      ),
    );
  }

  Widget _buildMenuGrid(List<Burger> items, KioskTheme theme) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length > 8 ? 8 : items.length,
            // 최대 8개까지 출력
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
