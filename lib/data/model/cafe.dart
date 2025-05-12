import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe.freezed.dart';

@freezed
abstract class Cafe with _$Cafe {
  const factory Cafe({
    required String name,
    required String imageUrl,
    required int price,
  }) = _Cafe;
}
