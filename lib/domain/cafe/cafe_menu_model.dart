import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_menu_model.freezed.dart';
part 'cafe_menu_model.g.dart';

@freezed
abstract class CafeMenuModel with _$CafeMenuModel {
  const factory CafeMenuModel({
    required String id,                        // 고유 ID
    required String name,                      // 메뉴 이름
    required String imageUrl,                  // 이미지 경로
    required int basePrice,                    // 기본 가격
    @Default('Tall') String size,              // 사이즈 (Short, Tall, Grande 등)
    @Default(false) bool isIced,               // 아이스 여부
    @Default(0) int extraShotCount,            // 추가 샷 개수
    @Default(false) bool withWhipping,         // 휘핑 추가 여부
    @Default('기본') String syrup,             // 시럽 종류 (기본, 바닐라, 헤이즐넛 등)
    @Default(1) int quantity,                  // 수량
  }) = _CafeMenuModel;

  factory CafeMenuModel.fromJson(Map<String, dynamic> json) =>
      _$CafeMenuModelFromJson(json);
}