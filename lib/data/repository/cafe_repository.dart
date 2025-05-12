import 'package:team_kiosk/data/model/cafe.dart';

abstract interface class CafeRepository {
  Future<List<Cafe>> getDrinkData();

  Future<List<Cafe>> getDessertData();
}
