import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/step_progress_bar.dart';
import 'package:team_kiosk/data/repository/burger_repository.dart';

class MenuSelectScreen extends ConsumerWidget {
  final BurgerRepository _repository;

  const MenuSelectScreen(this._repository, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final style = ref.read(textStyleSetProvider);
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
              SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 3 / 4, // width / height 비율
                          ),
                      itemBuilder: (context, index) {
                        return MenuCard(
                          image: 'assets/images/hamburger.png',
                          title: '햄버거',
                          price: 5000,
                          theme: theme,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ),
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
