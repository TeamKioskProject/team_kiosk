import 'package:riverpod/riverpod.dart';
import 'package:team_kiosk/data/data_source/order_item_data_source.dart';
import 'package:team_kiosk/data/data_source/order_item_data_source_impl.dart';
import 'package:team_kiosk/data/repository/order_repository_impl.dart';
import 'package:team_kiosk/domain/repository/order_repository.dart';

final orderItemDataSourceProvider = Provider<OrderItemDataSource>((ref) {
  return OrderItemDataSourceImpl();
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  // lazy initialization
  final dataSource = ref.watch(orderItemDataSourceProvider);
  return OrderRepositoryImpl(dataSource: dataSource);
});