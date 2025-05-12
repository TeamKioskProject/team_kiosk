import 'package:json_annotation/json_annotation.dart';

part 'dessert_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DessertDto {
  final String menuComponents;
  final String menuImgPath;
  final String menuCd;
  final String menuImgThumPath;
  final String menuImgMPath;
  final String spicyYn;
  final List<dynamic> menuFlagList;
  final String menuImgMThumPath;
  final String menuNm;
  final int price;

  DessertDto({
    required this.menuComponents,
    required this.menuImgPath,
    required this.menuCd,
    required this.menuImgThumPath,
    required this.menuImgMPath,
    required this.spicyYn,
    required this.menuFlagList,
    required this.menuImgMThumPath,
    required this.menuNm,
    required this.price,
  });

  factory DessertDto.fromJson(Map<String, dynamic> json) =>
      _$DessertDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DessertDtoToJson(this);
}
