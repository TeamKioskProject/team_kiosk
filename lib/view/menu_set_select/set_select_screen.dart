import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/core/widgets/kiosk/kiosk_app_bar.dart';
import 'package:team_kiosk/core/widgets/kiosk/menu_card.dart';
import 'package:team_kiosk/core/widgets/payment/dialog_action_button.dart';
import 'package:team_kiosk/view/menu_set_select/set_select_notifier.dart';
import 'package:team_kiosk/view/set_builder/set_builder_notification.dart';

class SetSelectScreen extends ConsumerWidget {
  final MenuCard menuData;

  const SetSelectScreen({super.key, required this.menuData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(kioskThemeProvider);
    final styles = ref.watch(textStyleSetProvider);
    final appState = ref.watch(appStateProvider);
    final setSelectState = ref.watch(setSelectProvider);
    final setBuilderState = ref.watch(setBuilderProvider);
    final setBuilderViewModel = ref.watch(setBuilderProvider.notifier);
    final viewModel = ref.watch(setSelectProvider.notifier);

    return Scaffold(
      appBar: KioskAppBar(
        title: '세트 선택',
        theme: theme,
        leading: IconButton(
          onPressed: () {
            setBuilderViewModel.resetState();
            viewModel.isSetChange(change: null);
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: theme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: ButtonStyles.kioskButton(Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Semantics(
                        label: '${menuData.title} 이미지',
                        hint: '선택된 메뉴의 이미지입니다',
                        child: Image.network(menuData.image),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(menuData.title, style: styles.headline2),
                    const SizedBox(height: 20),
                    Text(
                      '${NumberFormat.currency(locale: "ko_KR").format(int.parse(menuData.price.toString())).replaceAll("KRW", '')}원',
                      style: styles.accent.copyWith(color: theme.primary),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: ButtonStyles.kioskButton(Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('주문 유형을 선택해주세요', style: styles.headline2),
                    const SizedBox(height: 16),
                    GroupButton<String>(
                      buttons: ['단품', '세트'],
                      onSelected: (String value, int index, bool isSelected) {
                        viewModel.isSetChange(change: value == '세트');
                      },
                      options: GroupButtonOptions(
                        groupingType: GroupingType.column,
                        direction: Axis.vertical,
                        buttonWidth: double.infinity,
                        mainGroupAlignment: MainGroupAlignment.center,
                        crossGroupAlignment: CrossGroupAlignment.end,
                        groupRunAlignment: GroupRunAlignment.start,
                      ),
                      buttonBuilder: (select, text, context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 20,
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: select ? theme.primary : theme.subText,
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                text,
                                style: styles.button.copyWith(
                                  color: select ? theme.primary : theme.subText,
                                ),
                              ),
                              Text(
                                text == '단품'
                                    ? '${NumberFormat.currency(locale: "ko_KR").format(int.parse(menuData.price.toString())).replaceAll("KRW", '')}원'
                                    : '${NumberFormat.currency(locale: "ko_KR").format(int.parse((menuData.price + 2000).toString())).replaceAll("KRW", '')}원',
                                style: styles.button.copyWith(
                                  color: select ? theme.primary : theme.subText,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (setSelectState.isSetBool == true)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push('/set-builder', extra: menuData);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: ButtonStyles.kioskButton(Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('세트 구성', style: styles.headline2),
                            const SizedBox(height: 10),
                            Text(
                              '세트 구성을 선택해주세요',
                              style: styles.accent.copyWith(
                                color: theme.primary,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      setBuilderState.selectSideImage == ''
                                          ? Image.asset(
                                            'assets/icons/set_menu.png',
                                            width: 80,
                                            fit: BoxFit.contain,
                                          )
                                          : Image.network(
                                            setBuilderState.selectSideImage,
                                            width: 80,
                                            fit: BoxFit.contain,
                                          ),
                                      Text(setBuilderState.selectSideMenu),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      setBuilderState.selectDrinkImage == ''
                                          ? Image.asset(
                                            'assets/icons/set_menu.png',
                                            width: 80,
                                            fit: BoxFit.contain,
                                          )
                                          : Image.network(
                                            setBuilderState.selectDrinkImage,
                                            width: 80,
                                            fit: BoxFit.contain,
                                          ),
                                      Text(setBuilderState.selectDrink),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (setSelectState.isSetBool != null ||
                  (setSelectState.isSetBool == true &&
                      setBuilderState.selectDrink != '' &&
                      setBuilderState.selectSideMenu != ''))
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: DialogActionButton(
                    text: '다음 단계로',
                    onTapEvent: () {
                      context.push("/ingredient-select", extra: menuData);
                    },
                    theme: theme,
                    textStyleSet: styles,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
