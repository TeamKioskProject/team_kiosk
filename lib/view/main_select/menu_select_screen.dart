import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';
import 'package:team_kiosk/view/main_select/burger_provider/burger_provider.dart';

class MenuSelectScreen extends ConsumerWidget {
  const MenuSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final style = ref.read(textStyleSetProvider);
    final burgerListAsync = ref.watch(burgerListProvider);
    return DefaultTabController(
      length: 4,
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
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme == KioskTheme.fromMode(KioskMode.burger) ? '햄버거' : '커피',
              theme == KioskTheme.fromMode(KioskMode.burger)
                  ? Icons.lunch_dining
                  : Icons.coffee,
              theme,
            ),
          ),
        ),
        body: Container(
          color: theme.background,
          child: TabBarView(
            children: [
              burgerListAsync.when(
                data:
                    (burgerList) => SingleChildScrollView(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 8,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 18,
                                  childAspectRatio: 3 / 4,
                                ),
                            itemBuilder: (context, index) {
                              final burger = burgerList[index];
                              return MenuCard(
                                image: burger.imageUrl,
                                title: burger.name,
                                price: burger.price,
                                theme: theme,
                                onTap: () {
                                  // TODO: 선택 동작 처리
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('오류 발생: $error')),
              ),
              const Center(child: Text('Step 2')),
              const Center(child: Text('Step 3')),
              const Center(child: Text('Step 4')),
            ],
          ),
        ),
      ),
    );
  }
}
