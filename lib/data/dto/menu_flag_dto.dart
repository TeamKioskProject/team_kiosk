import 'package:json_annotation/json_annotation.dart';

part 'menu_flag_dto.g.dart';

@JsonSerializable()
class MenuFlagDto {
  final String menuFlagPk;
  final String menuFlagNm;

  MenuFlagDto({required this.menuFlagPk, required this.menuFlagNm});

  factory MenuFlagDto.fromJson(Map<String, dynamic> json) =>
      _$MenuFlagDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuFlagDtoToJson(this);
}
