import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_type_dto.freezed.dart';

part 'cafe_type_dto.g.dart';

@freezed
abstract class CafeTypeDto with _$CafeTypeDto {
  const factory CafeTypeDto({
    String? name,
    String? content,
    String? category,
    int? price,
    String? image,
    String? id,
  }) = _CafeTypeDto;

  factory CafeTypeDto.fromJson(Map<String, dynamic> json) =>
      _$CafeTypeDtoFromJson(json);
}
