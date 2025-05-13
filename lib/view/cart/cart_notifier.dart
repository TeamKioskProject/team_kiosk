// lib/features/cart/viewmodel/cart_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/view/cart/cart_item.dart';
import 'package:team_kiosk/view/cart/cart_state.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState.initial();
  }

  void resetState() {
    state = state.copyWith(cartItems: [], totalQuantity: 0, totalAmount: 0);
  }

  void addItem(CartItem item) {
    final items = [...state.cartItems];
    final index = items.indexWhere((e) => e.id == item.id);

    if (index >= 0) {
      // 이미 있으면 수량 증가
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    } else {
      // 없으면 추가
      items.add(item);
    }

    final totalQuantity = items.fold<int>(0, (sum, i) => sum + i.quantity);
    final totalAmount = items.fold<int>(
      0,
      (sum, i) => sum + (i.price * i.quantity),
    );

    state = state.copyWith(
      cartItems: items,
      totalQuantity: totalQuantity,
      totalAmount: totalAmount,
    );
  }

  void removeItem(String id) {
    final updatedItems =
        state.cartItems.where((item) => item.id != id).toList();
    final updatedTotalAmount = updatedItems.fold<int>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    state = state.copyWith(
      cartItems: updatedItems,
      totalAmount: updatedTotalAmount,
    );
  }

  void incrementQuantity(String id) {
    final updatedItems =
        state.cartItems.map((item) {
          if (item.id == id) {
            return item.copyWith(quantity: item.quantity + 1);
          }
          return item;
        }).toList();

    final updatedTotalAmount = updatedItems.fold<int>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    state = state.copyWith(
      cartItems: updatedItems,
      totalAmount: updatedTotalAmount,
    );
  }

  void decrementQuantity(String id) {
    final updatedItems = state.cartItems.fold<List<CartItem>>([], (list, item) {
      if (item.id == id && item.quantity > 1) {
        list.add(item.copyWith(quantity: item.quantity - 1));
      } else if (item.id != id) {
        list.add(item);
      }
      return list;
    });

    final updatedTotalAmount = updatedItems.fold<int>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    state = state.copyWith(
      cartItems: updatedItems,
      totalAmount: updatedTotalAmount,
    );
  }

  void clearCart() {
    state = CartState.initial();
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, CartState>(
  () => CartNotifier(),
);
