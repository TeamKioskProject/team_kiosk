// lib/features/cart/model/cart_item.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required String name,
    required int quantity,
    required int price,
    required String imagePath
  }) = _CartItem;
}