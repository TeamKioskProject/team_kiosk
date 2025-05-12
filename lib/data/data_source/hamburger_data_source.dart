import 'package:team_kiosk/data/dto/hamburger_dto.dart';

abstract interface class HamburgerDataSource {
  Future<List<HamburgerDto>> getBurgerData();

  Future<List<HamburgerDto>> getDessertData();

  Future<List<HamburgerDto>> getDrinkData();

  Future<List<HamburgerDto>> getSideData();
}
