// lib/features/cart/model/cart_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    required List<CartItem> cartItems,
    required int totalAmount,
    required int totalQuantity,
  }) = _CartState;

  factory CartState.initial() {
    return const CartState(cartItems: [], totalAmount: 0, totalQuantity: 0);
  }
}
