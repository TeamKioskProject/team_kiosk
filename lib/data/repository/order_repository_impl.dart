import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/data_source/order_item_data_source.dart';
import 'package:team_kiosk/data/dto/burger_type_dto.dart';
import 'package:team_kiosk/data/dto/cafe_type_dto.dart';
import 'package:team_kiosk/data/mapper/order_item_mapper.dart';
import 'package:team_kiosk/data/model/order_item.dart';
import 'package:team_kiosk/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderItemDataSource dataSource;

  const OrderRepositoryImpl({required this.dataSource});

  @override
  Future<List<OrderItem>> getOrderItem({required CategoryType type}) async {
    switch (type) {
      case CategoryType.burger:
        final List<BurgerTypeDto> orderDtoItemList = await dataSource
            .getBurgerData(type: BurgerType.burger);
        return orderDtoItemList
            .map((items) => items.toOrderItemBurger(type: type))
            .toList();
      case CategoryType.burgerDrink:
        final List<BurgerTypeDto> orderDtoItemList = await dataSource
            .getBurgerData(type: BurgerType.burgerDrink);
        return orderDtoItemList
            .map((items) => items.toOrderItemBurger(type: type))
            .toList();
      case CategoryType.burgerDessert:
        final List<BurgerTypeDto> orderDtoItemList = await dataSource
            .getBurgerData(type: BurgerType.burgerDessert);
        return orderDtoItemList
            .map((items) => items.toOrderItemBurger(type: type))
            .toList();
      case CategoryType.burgerSide:
        final List<BurgerTypeDto> orderDtoItemList = await dataSource
            .getBurgerData(type: BurgerType.burgerSide);
        return orderDtoItemList
            .map((items) => items.toOrderItemBurger(type: type))
            .toList();
      case CategoryType.cafeDrink:
        final List<CafeTypeDto> orderDtoItemList = await dataSource.getCafeData(
          type: CafeType.cafeDrink,
        );
        return orderDtoItemList
            .map((items) => items.toOrderItemCafe(type: type))
            .toList();
      case CategoryType.cafeDessert:
        final List<CafeTypeDto> orderDtoItemList = await dataSource.getCafeData(
          type: CafeType.cafeDessert,
        );
        return orderDtoItemList
            .map((items) => items.toOrderItemCafe(type: type))
            .toList();
    }
  }
}
