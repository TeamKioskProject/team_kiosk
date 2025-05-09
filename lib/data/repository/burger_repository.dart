import 'package:team_kiosk/data/model/burger.dart';

abstract interface class BurgerRepository {
  Future<List<Burger>> getBurgers();
}
