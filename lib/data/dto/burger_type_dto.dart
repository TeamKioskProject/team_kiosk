import 'package:freezed_annotation/freezed_annotation.dart';

part 'burger_type_dto.freezed.dart';
part 'burger_type_dto.g.dart';

@freezed
abstract class BurgerTypeDto with _$BurgerTypeDto {
  const factory BurgerTypeDto({
    String? menuComponents,
    String? menuImgPath,
    String? menuCd,
    String? menuImgThumPath,
    String? menuImgMPath,
    String? spicyYn,
    List<BurgerTypeDtoMenuFlagList?>? menuFlagList,
    String? menuImgMThumPath,
    String? menuNm,
    int? price,
  }) = _BurgerTypeDto;

  factory BurgerTypeDto.fromJson(Map<String, dynamic> json) =>
      _$BurgerTypeDtoFromJson(json);
}

@freezed
abstract class BurgerTypeDtoMenuFlagList with _$BurgerTypeDtoMenuFlagList {
  const factory BurgerTypeDtoMenuFlagList({
    String? menuFlagPk,
    String? menuFlagNm,
  }) = _BurgerTypeDtoMenuFlagList;

  factory BurgerTypeDtoMenuFlagList.fromJson(Map<String, dynamic> json) =>
      _$BurgerTypeDtoMenuFlagListFromJson(json);
}
