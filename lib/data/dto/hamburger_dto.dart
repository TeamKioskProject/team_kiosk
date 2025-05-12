import 'package:json_annotation/json_annotation.dart';
import 'package:team_kiosk/data/dto/menu_flag_dto.dart';

part 'hamburger_dto.g.dart';

@JsonSerializable()
class HamburgerDto {
  final String menuComponents;
  final String menuImgPath;
  final String menuCd;
  final String menuImgThumPath;
  final String menuImgMPath;
  final String spicyYn;
  final List<MenuFlagDto> menuFlagList;
  final String menuImgMThumPath;
  final String menuNm;
  final int price;

  HamburgerDto({
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

  factory HamburgerDto.fromJson(Map<String, dynamic> json) =>
      _$HamburgerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HamburgerDtoToJson(this);
}
