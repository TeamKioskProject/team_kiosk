import 'package:team_kiosk/data/data_source/burger_data_source.dart';
import 'package:team_kiosk/data/mapper/buger_mapper.dart';
import 'package:team_kiosk/data/model/burger.dart';
import 'package:team_kiosk/data/repository/burger_repository.dart';

class HamburgerRepositoryImpl implements BurgerRepository {
  final BurgerDataSource _dataSource;

  BurgerRepositoryImpl({required BurgerDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<List<Burger>> getBurgers() async {
    final dtoList = await _dataSource.getBurgerData();
    final burgerList = dtoList.map((e) => e.toBurger()).toList();
    return burgerList;
  }
}
