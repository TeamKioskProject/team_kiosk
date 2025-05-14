import 'package:team_kiosk/data/dto/burger_type_dto.dart';

abstract interface class HamburgerDataSource {
  Future<List<BurgerTypeDto>> getBurgerData();

  Future<List<BurgerTypeDto>> getDessertData();

  Future<List<BurgerTypeDto>> getDrinkData();

  Future<List<BurgerTypeDto>> getSideData();
}
