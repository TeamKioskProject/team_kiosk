import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/data/data_source/cafe_data_source_impl.dart';
import 'package:team_kiosk/data/model/cafe.dart';
import 'package:team_kiosk/data/repository/cafe_repository.dart';
import 'package:team_kiosk/domain/repository/cafe_repository_impl.dart';

// 디저트 리스트 Provider
final cafeDessertListProvider = FutureProvider.autoDispose<List<Cafe>>((
  ref,
) async {
  final repository = ref.watch(cafeRepositoryProvider);
  return await repository.getDessertData();
});

// 음료 리스트 Provider
final cafeDrinkListProvider = FutureProvider.autoDispose<List<Cafe>>((
  ref,
) async {
  final repository = ref.watch(cafeRepositoryProvider);
  return await repository.getDrinkData();
});

final cafeRepositoryProvider = Provider<CafeRepository>((ref) {
  return CafeRepositoryImpl(dataSource: CafeDataSourceImpl());
});
