import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/data/data_source/burger_data_source_impl.dart';
import 'package:team_kiosk/data/repository/burger_repository.dart';
import 'package:team_kiosk/domain/hamburger/hamburger_menu_model.dart';
import 'package:team_kiosk/domain/repository/burger_repository_impl.dart';

final burgerListProvider = FutureProvider.autoDispose<List<HamburgerMenuModel>>(
  (ref) async {
    final repository = ref.watch(burgerRepositoryProvider);
    return await repository.getBurgers();
  },
);

final burgerRepositoryProvider = Provider<BurgerRepository>((ref) {
  return BurgerRepositoryImpl(dataSource: BurgerDataSourceImpl());
});
