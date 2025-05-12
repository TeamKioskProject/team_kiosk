import 'package:freezed_annotation/freezed_annotation.dart';

part 'buger_type_dto.freezed.dart';

part 'buger_type_dto.g.dart';

@freezed
abstract class BugerTypeDto with _$BugerTypeDto {
  const factory BugerTypeDto({
    String? menuComponents,
    String? menuImgPath,
    String? menuCd,
    String? menuImgThumPath,
    String? menuImgMPath,
    String? spicyYn,
    List<BugerTypeDtoMenuFlagList?>? menuFlagList,
    String? menuImgMThumPath,
    String? menuNm,
    int? price,
  }) = _BugerTypeDto;

  factory BugerTypeDto.fromJson(Map<String, dynamic> json) =>
      _$BugerTypeDtoFromJson(json);
}

@freezed
abstract class BugerTypeDtoMenuFlagList with _$BugerTypeDtoMenuFlagList {
  const factory BugerTypeDtoMenuFlagList({
    String? menuFlagPk,
    String? menuFlagNm,
  }) = _BugerTypeDtoMenuFlagList;

  factory BugerTypeDtoMenuFlagList.fromJson(Map<String, dynamic> json) =>
      _$BugerTypeDtoMenuFlagListFromJson(json);
}
