import 'package:freezed_annotation/freezed_annotation.dart';

part 'burger.freezed.dart';

@freezed
abstract class Burger with _$Burger {
  const factory Burger({
    required String name,
    required String imageUrl,
    required int price,
  }) = _Burger;
}
