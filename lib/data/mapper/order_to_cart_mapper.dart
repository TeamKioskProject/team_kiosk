import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/model/order_item.dart';
import 'package:team_kiosk/view/cart/cart_item.dart';

extension OrderToCartMapper on OrderItem {
  CartItem toCart({required CategoryType type}) {
    return CartItem(
      id: id,
      name: name,
      quantity: 1,
      price: price,
      imagePath: imageUrl,
    );
  }
}
