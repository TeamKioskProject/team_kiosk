import 'package:team_kiosk/data/data_source/hamburger_data_source.dart';
import 'package:team_kiosk/data/mapper/hamburger_mapper.dart';
import 'package:team_kiosk/data/model/burger.dart';
import 'package:team_kiosk/data/repository/hamburger_repository.dart';

class HamburgerRepositoryImpl implements HamburgerRepository {
  final HamburgerDataSource _dataSource;

  HamburgerRepositoryImpl({required HamburgerDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Burger>> getBurgers() async {
    final dtoList = await _dataSource.getBurgerData();
    final burgerList = dtoList.map((e) => e.toHamBurger()).toList();
    return burgerList;
  }

  @override
  Future<List<Burger>> getDesserts() async {
    final dtoList = await _dataSource.getDessertData();
    final burgerList = dtoList.map((e) => e.toHamBurger()).toList();
    return burgerList;
  }

  @override
  Future<List<Burger>> getDrinks() async {
    final dtoList = await _dataSource.getDrinkData();
    final burgerList = dtoList.map((e) => e.toHamBurger()).toList();
    return burgerList;
  }
}
