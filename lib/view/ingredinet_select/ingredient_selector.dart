// ingredient_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/view/ingredinet_select/ingredient_notifier.dart';

class IngredientSelector extends ConsumerWidget {
  final String imageUri;

  const IngredientSelector({super.key, required this.imageUri});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    final styles = ref.watch(textStyleSetProvider);
    final appState = ref.watch(appStateProvider);
    final state = ref.watch(ingredientProvider);
    final viewModel = ref.read(ingredientProvider.notifier);

    return Scaffold(
      appBar: KioskAppBar(
        title: '재료 선택',
        theme: theme,
        leading:
            context.canPop()
                ? IconButton(
                  onPressed: () {
                    viewModel.resetSelection();
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back),
                )
                : null,
      ),
      backgroundColor: theme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(imageUri),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      theme == KioskTheme.fromMode(KioskMode.cafe)
                          ? '음료에 토핑을 추가 할까요?'
                          : '햄버거 재료를 변경할까요?',
                      style: styles.body,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '원하시는 재료를 선택해주세요',
                      style: styles.body.copyWith(color: theme.subText),
                    ),
                    if (theme == KioskTheme.fromMode(KioskMode.burger))
                      Column(
                        children:
                            state.burgerOptions.asMap().entries.map((entry) {
                              int index = entry.key;
                              var items = entry.value;
                              return _ingredientTile(
                                items["name"],
                                items["icon"],
                                items["isSelected"],
                                index,
                                (index) => {
                                  viewModel.toggleSelection(index, false),
                                },
                                iconColor: items["color"],
                                textSet: styles,
                              );
                            }).toList(),
                      ),
                    if (theme == KioskTheme.fromMode(KioskMode.cafe))
                      Column(
                        children:
                            state.cafeOptions.asMap().entries.map((entry) {
                              int index = entry.key;
                              var items = entry.value;
                              return _ingredientTile(
                                items["name"],
                                items["icon"],
                                items["isSelected"],
                                index,
                                (index) => {
                                  viewModel.toggleSelection(index, true),
                                },
                                iconColor: items["color"],
                                textSet: styles,
                              );
                            }).toList(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _ingredientTile(
    String name,
    IconData icon,
    bool selected,
    int index,
    Function(int) onChanged, {
    Color? iconColor,
    required TextStyleSet textSet,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.green, size: 32),
        title: Text(name, style: textSet.body),
        trailing: Switch(
          value: selected,
          onChanged: (value) {
            onChanged(index);
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
