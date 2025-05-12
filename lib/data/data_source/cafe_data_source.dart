import 'package:team_kiosk/data/dto/cafe_dto.dart';

abstract interface class CafeDataSource {
  Future<List<CafeDto>> getDrinkData();

  Future<List<CafeDto>> getDessertData();
}
