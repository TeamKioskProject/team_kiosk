import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/menu/burger_card.dart';
import 'package:team_kiosk/data/model/order_item.dart';
import 'package:team_kiosk/view/set_builder/set_builder_notification.dart';
import 'package:team_kiosk/view/set_builder/set_builder_state.dart';

class SetBuilderScreen extends ConsumerWidget {
  final MenuCard menuCard;

  const SetBuilderScreen({super.key, required this.menuCard});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(kioskThemeProvider);
    final textStyles = ref.read(textStyleSetProvider);
    final state = ref.watch(setBuilderProvider);
    final viewModel = ref.watch(setBuilderProvider.notifier);

    return Scaffold(
      appBar: KioskAppBar(title: '세트 구성 선택', theme: theme),
      backgroundColor: theme.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: BurgerCard(
                      name: menuCard.title,
                      price: menuCard.price.toString(),
                      textStyleSet: textStyles,
                      theme: theme,
                      image: SizedBox(
                        width: 80,
                        child: Image.network(menuCard.image, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('사이드 메뉴 선택', style: textStyles.headline2),
                  ),

                  _buildMenuGrid(
                    state.sideMenuList,
                    theme,
                    'side',
                    viewModel,
                    state,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('음료 선택', style: textStyles.headline2),
                  ),

                  _buildMenuGrid(
                    state.drinkMenuList,
                    theme,
                    'drink',
                    viewModel,
                    state,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: CategoryCard(
              icon: Icons.check,
              category: Category.burger,
              theme: theme,
              text: '선택 완료',
              onTap: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(
    List<OrderItem> items,
    KioskTheme theme,
    String type,
    SetBuilderNotification viewModel,
    SetBuilderState state,
  ) {
    return Padding(
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
            categoryType: item.category,
            id: item.id,
            isSelected:
                type == 'side'
                    ? state.selectSideMenu == item.name
                    : state.selectDrink == item.name,
            theme: theme,
            onTap: () {
              if (type == "side") {
                viewModel.selectSideMenu(name: item.name);
              } else {
                viewModel.selectDrinkMenu(name: item.name);
              }
            },
          );
        },
      ),
    );
  }
}
