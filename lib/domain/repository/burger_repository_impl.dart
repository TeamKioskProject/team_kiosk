import 'package:team_kiosk/data/data_source/burger_data_source.dart';
import 'package:team_kiosk/data/repository/burger_repository.dart';
import 'package:team_kiosk/domain/hamburger/hamburger_menu_model.dart';

class BurgerRepositoryImpl implements BurgerRepository {
  final BurgerDataSource _dataSource;

  BurgerRepositoryImpl({required BurgerDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<HamburgerMenuModel>> getBurgers() async {
    final burgerList = await _dataSource.getBurgerData();
    return burgerList;
  }
}
