import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/data/data_source/hamburger_data_source_impl.dart';
import 'package:team_kiosk/data/model/burger.dart';
import 'package:team_kiosk/data/repository/hamburger_repository.dart';
import 'package:team_kiosk/domain/repository/hamburger_repository_impl.dart';

//햄버거 리스트 Provider
final burgerListProvider = FutureProvider.autoDispose<List<Burger>>((
  ref,
) async {
  final repository = ref.watch(burgerRepositoryProvider);
  return await repository.getBurgers();
});

// 디저트 리스트 Provider
final dessertListProvider = FutureProvider.autoDispose<List<Burger>>((
  ref,
) async {
  final repository = ref.watch(burgerRepositoryProvider);
  return await repository.getDesserts();
});

// 음료 리스트 Provider
final drinkListProvider = FutureProvider.autoDispose<List<Burger>>((ref) async {
  final repository = ref.watch(burgerRepositoryProvider);
  return await repository.getDrinks();
});

final burgerRepositoryProvider = Provider<HamburgerRepository>((ref) {
  return HamburgerRepositoryImpl(dataSource: HamburgerDataSourceImpl());
});
