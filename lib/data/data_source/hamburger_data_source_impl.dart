import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/hamburger_data_source.dart';
import 'package:team_kiosk/data/dto/burger_type_dto.dart';

class HamburgerDataSourceImpl implements HamburgerDataSource {
  static const String burgerPath = 'lib/data/data/burger_mock_data.json';
  static const String dessertPath = 'lib/data/data/dessert_mock_data.json';
  static const String drinkPath = 'lib/data/data/drink_mock_data.json';
  static const String sidePath = 'lib/data/data/side_mock_data.json';

  @override
  Future<List<BurgerTypeDto>> getBurgerData() async {
    try {
      final jsonString = await rootBundle.loadString(burgerPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['burgers'];
      final burgerList = jsonList.map((e) => BurgerTypeDto.fromJson(e)).toList();

      return burgerList;
    } catch (e) {
      throw Exception('burger.json 로드 실패: $e');
    }
  }

  @override
  Future<List<BurgerTypeDto>> getDessertData() async {
    try {
      final jsonString = await rootBundle.loadString(dessertPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['dessert'];
      final dessertList =
          jsonList.map((e) => BurgerTypeDto.fromJson(e)).toList();

      return dessertList;
    } catch (e) {
      throw Exception('dessert.json 로드 실패: $e');
    }
  }

  @override
  Future<List<BurgerTypeDto>> getDrinkData() async {
    try {
      final jsonString = await rootBundle.loadString(drinkPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['drink'];
      final drinkList = jsonList.map((e) => BurgerTypeDto.fromJson(e)).toList();

      return drinkList;
    } catch (e) {
      throw Exception('drink.json 로드 실패: $e');
    }
  }

  @override
  Future<List<BurgerTypeDto>> getSideData() async {
    try {
      final jsonString = await rootBundle.loadString(sidePath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['side'];
      final sideList = jsonList.map((e) => BurgerTypeDto.fromJson(e)).toList();

      return sideList;
    } catch (e) {
      throw Exception('side.json 로드 실패: $e');
    }
  }
}
