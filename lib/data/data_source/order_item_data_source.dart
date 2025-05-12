import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/dto/burger_type_dto.dart';
import 'package:team_kiosk/data/dto/cafe_type_dto.dart';

abstract interface class OrderItemDataSource {
  Future<List<BurgerTypeDto>> getBurgerData({required BurgerType type});

  Future<List<CafeTypeDto>> getCafeData({required CafeType type});
}
