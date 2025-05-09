// lib/features/cart/viewmodel/cart_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/view/cart/cart_item.dart';
import 'package:team_kiosk/view/cart/cart_state.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState.initial();
  }

  void addItem(CartItem item) {
    final existingItemIndex = state.cartItems.indexWhere((i) => i.id == item.id);
    if (existingItemIndex != -1) {
      final updatedItems = List<CartItem>.from(state.cartItems);
      final existingItem = updatedItems[existingItemIndex];
      final updatedItem = existingItem.copyWith(quantity: existingItem.quantity + item.quantity);
      updatedItems[existingItemIndex] = updatedItem;

      final updatedTotalAmount = updatedItems.fold<int>(
        0,
            (sum, item) => sum + (item.price * item.quantity),
      );

      state = state.copyWith(
        cartItems: updatedItems,
        totalAmount: updatedTotalAmount,
      );
    } else {
      final updatedItems = [...state.cartItems, item];
      final updatedTotalAmount = updatedItems.fold<int>(
        0,
            (sum, item) => sum + (item.price * item.quantity),
      );

      state = state.copyWith(
        cartItems: updatedItems,
        totalAmount: updatedTotalAmount,
      );
    }
  }

  void removeItem(String id) {
    final updatedItems = state.cartItems.where((item) => item.id != id).toList();
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
    final updatedItems = state.cartItems.map((item) {
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
