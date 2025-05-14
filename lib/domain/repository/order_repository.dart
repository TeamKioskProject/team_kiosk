import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/model/order_item.dart';

abstract interface class OrderRepository {
  Future<List<OrderItem>> getOrderItem({required CategoryType type});
}
