import 'package:team_kiosk/data/model/burger.dart';

abstract interface class HamburgerRepository {
  Future<List<Burger>> getBurgers();

  Future<List<Burger>> getDesserts();

  Future<List<Burger>> getDrinks();

  Future<List<Burger>> getSides();
}
