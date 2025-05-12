import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/data_source/order_item_data_source.dart';
import 'package:team_kiosk/data/dto/buger_type_dto.dart';
import 'package:team_kiosk/data/dto/cafe_type_dto.dart';

class OrderItemDataSourceImpl implements OrderItemDataSource {
  @override
  Future<List<BugerTypeDto>> getBugerData({required BugerType type}) async {
    switch (type) {
      case BugerType.buger:
        final respone = await rootBundle.loadString(
          'lib/data/data/burger_mock_data.json',
        );
        final List data = jsonDecode(respone)['burgers'] as List;

        return data.map((items) => BugerTypeDto.fromJson(items)).toList();
      case BugerType.bugerDrink:
        final respone = await rootBundle.loadString(
          'lib/data/data/drink_mock_data.json',
        );
        final List data = jsonDecode(respone)  as List;
        return data.map((items) => BugerTypeDto.fromJson(items)).toList();
      case BugerType.bugerDessert:
        final respone = await rootBundle.loadString(
          'lib/data/data/dessert_mock_data.json',
        );
        final List data = jsonDecode(respone)  as List;
        return data.map((items) => BugerTypeDto.fromJson(items)).toList();
      case BugerType.bugerSide:
        final respone = await rootBundle.loadString(
          'lib/data/data/side_mock_data.json',
        );
        final List data = jsonDecode(respone) as List ;
        return data.map((items) => BugerTypeDto.fromJson(items)).toList();
    }
  }

  @override
  Future<List<CafeTypeDto>> getCafeData({required CafeType type}) async {

    switch (type) {
      case CafeType.cafeDrink:
        final respone = await rootBundle.loadString(
          'lib/data/data/starbucks_drinks_trimmed.json',
        );
        final data = await jsonDecode(respone)['beverage'] as List;
        return data.map((items) => CafeTypeDto.fromJson(items)).toList();
      case CafeType.cafeDessert:
        final respone = await rootBundle.loadString(
          'lib/data/data/starbucks_desserts.json',
        );
        final data = await jsonDecode(respone)['desserts'] as List;
        return data.map((items) => CafeTypeDto.fromJson(items)).toList();
    }
  }
}
