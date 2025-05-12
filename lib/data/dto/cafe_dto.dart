import 'package:json_annotation/json_annotation.dart';

part 'cafe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CafeDto {
  final String? name;
  final String? content;
  final String? category;
  final int? price;
  final String? image;
  final String? id;

  CafeDto(
    this.name,
    this.content,
    this.category,
    this.price,
    this.image,
    this.id,
  );

  factory CafeDto.fromJson(Map<String, dynamic> json) =>
      _$CafeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CafeDtoToJson(this);
}
