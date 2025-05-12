import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/data_source/order_item_data_source.dart';
import 'package:team_kiosk/data/dto/burger_type_dto.dart';
import 'package:team_kiosk/data/dto/cafe_type_dto.dart';

class OrderItemDataSourceImpl implements OrderItemDataSource {
  @override
  Future<List<BurgerTypeDto>> getBurgerData({required BurgerType type}) async {
    switch (type) {
      case BurgerType.burger:
        final response = await rootBundle.loadString(
          'lib/data/data/burger_mock_data.json',
        );
        final List data = jsonDecode(response)['burgers'] as List;
        return data.map((items) => BurgerTypeDto.fromJson(items)).toList();

      case BurgerType.burgerDrink:
        final response = await rootBundle.loadString(
          'lib/data/data/drink_mock_data.json',
        );
        final List data = jsonDecode(response)['drink'] as List;
        return data.map((items) => BurgerTypeDto.fromJson(items)).toList();

      case BurgerType.burgerDessert:
        final response = await rootBundle.loadString(
          'lib/data/data/dessert_mock_data.json',
        );
        final List data = jsonDecode(response)['dessert'] as List;
        return data.map((items) => BurgerTypeDto.fromJson(items)).toList();

      case BurgerType.burgerSide:
        final response = await rootBundle.loadString(
          'lib/data/data/side_mock_data.json',
        );
        final List data = jsonDecode(response)['side'] as List;
        return data.map((items) => BurgerTypeDto.fromJson(items)).toList();
    }
  }

  @override
  Future<List<CafeTypeDto>> getCafeData({required CafeType type}) async {
    switch (type) {
      case CafeType.cafeDrink:
        final response = await rootBundle.loadString(
          'lib/data/data/starbucks_drinks_trimmed.json',
        );
        final data = await jsonDecode(response)['beverage'] as List;
        return data.map((items) => CafeTypeDto.fromJson(items)).toList();
      case CafeType.cafeDessert:
        final response = await rootBundle.loadString(
          'lib/data/data/starbucks_desserts.json',
        );
        final data = await jsonDecode(response)['desserts'] as List;
        return data.map((items) => CafeTypeDto.fromJson(items)).toList();
    }
  }
}
