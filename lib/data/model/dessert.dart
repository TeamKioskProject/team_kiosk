import 'package:freezed_annotation/freezed_annotation.dart';

part 'dessert.freezed.dart';

@freezed
abstract class Dessert with _$Dessert {
  const factory Dessert({
    required String name,
    required String imageUrl,
    required int price,
  }) = _Dessert;
}
