import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/dto/buger_type_dto.dart';
import 'package:team_kiosk/data/dto/cafe_type_dto.dart';
import 'package:team_kiosk/data/model/order_item.dart';

abstract interface class OrderItemDataSource {
  Future<List<BugerTypeDto>> getBugerData({required BugerType type});
  Future<List<CafeTypeDto>> getCafeData({required CafeType type});
}
