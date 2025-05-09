import 'package:team_kiosk/domain/hamburger/hamburger_menu_model.dart';

abstract interface class BurgerRepository {
  Future<List<HamburgerMenuModel>> getBurgers();
}
