import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/view/ingredinet_select/ingredient_state.dart';

class IngredientNotifier extends Notifier<IngredientState> {
  @override
  IngredientState build() => const IngredientState();


  void resetSelection() {
    final resetCafeOptions = state.cafeOptions.map((item) {
      return {
        ...item,
        "isSelected": false,
      };
    }).toList();

    final resetBurgerOptions = state.burgerOptions.map((item) {
      return {
        ...item,
        "isSelected": false,
      };
    }).toList();

    state = state.copyWith(
      cafeOptions: resetCafeOptions,
      burgerOptions: resetBurgerOptions,
    );
  }

  // 특정 인덱스의 선택 상태를 토글하는 메서드
  void toggleSelection(int index, bool isCafe) {
    if (isCafe) {
      // 카페 옵션 수정
      final updatedCafeOptions = state.cafeOptions.asMap().entries.map((entry) {
        if (entry.key == index) {
          return {
            ...entry.value,
            "isSelected": !entry.value["isSelected"],
          };
        }
        return entry.value;
      }).toList();

      state = state.copyWith(cafeOptions: updatedCafeOptions);
    } else {
      // 버거 옵션 수정
      final updatedBurgerOptions = state.burgerOptions.asMap().entries.map((entry) {
        if (entry.key == index) {
          return {
            ...entry.value,
            "isSelected": !entry.value["isSelected"],
          };
        }
        return entry.value;
      }).toList();

      state = state.copyWith(burgerOptions: updatedBurgerOptions);
    }
  }
}

final ingredientProvider =
    NotifierProvider<IngredientNotifier, IngredientState>(
      () => IngredientNotifier(),
    );
