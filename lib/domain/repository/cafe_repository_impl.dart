import 'package:team_kiosk/data/data_source/cafe_data_source.dart';
import 'package:team_kiosk/data/mapper/cafe_mapper.dart';
import 'package:team_kiosk/data/model/cafe.dart';
import 'package:team_kiosk/data/repository/cafe_repository.dart';

class CafeRepositoryImpl implements CafeRepository {
  final CafeDataSource _dataSource;

  CafeRepositoryImpl({required CafeDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Cafe>> getDessertData() async {
    final dtoList = await _dataSource.getDessertData();
    final dessertList = dtoList.map((e) => e.toCafe()).toList();
    return dessertList;
  }

  @override
  Future<List<Cafe>> getDrinkData() async {
    final dtoList = await _dataSource.getDrinkData();
    final drinkList = dtoList.map((e) => e.toCafe()).toList();
    return drinkList;
  }
}
