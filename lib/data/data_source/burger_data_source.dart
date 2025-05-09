import 'package:team_kiosk/data/dto/burger_dto.dart';

abstract interface class BurgerDataSource {
  Future<List<BurgerDto>> getBurgerData();
}
