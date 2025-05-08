// lib/features/cart/model/cart_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_kiosk/core/widgets/payment/mock_data.dart';
import 'cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    required List<CartItem> cartItems,
    required int totalAmount,
  }) = _CartState;

  factory CartState.initial() => CartState(
    cartItems:
        mockData
            .map(
              (items) => CartItem(
                id: items["menuCd"],
                name: items["menuNm"],
                quantity: 1,
                price: items["price"],
                imagePath: items["menuImgThumPath"],
              ),
            )
            .toList(),
    totalAmount: mockData.fold<int>(0, (sum, items) => sum + (items["price"] * 1 as int)),
  );
}
