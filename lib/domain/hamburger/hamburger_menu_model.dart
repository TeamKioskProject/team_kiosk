import 'package:freezed_annotation/freezed_annotation.dart';

part 'hamburger_menu_model.freezed.dart';
part 'hamburger_menu_model.g.dart';

@freezed
abstract class HamburgerMenuModel with _$HamburgerMenuModel {
  const factory HamburgerMenuModel({
    required String id,                        // 메뉴 고유 ID
    required String name,                      // 햄버거 이름
    required String imageUrl,                  // 이미지 경로
    required int basePrice,                    // 기본 가격
    @Default(false) bool isSet,                // 세트 여부
    String? sideMenu,                          // 선택된 사이드
    String? drink,                             // 선택된 음료
    @Default([]) List<String> removedIngredients, // 제외할 재료
    @Default([]) List<String> addedIngredients,   // 추가 재료
    @Default(1) int quantity,                  // 수량
  }) = _HamburgerMenuModel;

  factory HamburgerMenuModel.fromJson(Map<String, dynamic> json) =>
      _$HamburgerMenuModelFromJson(json);
}