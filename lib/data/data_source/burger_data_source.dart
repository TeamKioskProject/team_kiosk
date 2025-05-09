import 'package:team_kiosk/domain/hamburger/hamburger_menu_model.dart';

abstract interface class BurgerDataSource{
  Future<List<HamburgerMenuModel>> getBurgerData();
}