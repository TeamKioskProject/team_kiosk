import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/hamburger_data_source.dart';
import 'package:team_kiosk/data/dto/hamburger_dto.dart';

class HamburgerDataSourceImpl implements HamburgerDataSource {
  static const String burgerPath = 'lib/data/data/burger_mock_data.json';
  static const String dessertPath = 'lib/data/data/dessert_mock_data.json';
  static const String drinkPath = 'lib/data/data/drink_mock_data.json';

  @override
  Future<List<HamburgerDto>> getBurgerData() async {
    try {
      final jsonString = await rootBundle.loadString(burgerPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['burgers'];
      final burgerList = jsonList.map((e) => HamburgerDto.fromJson(e)).toList();

      return burgerList;
    } catch (e) {
      throw Exception('burger.json 로드 실패: $e');
    }
  }

  @override
  Future<List<HamburgerDto>> getDessertData() async {
    try {
      final jsonString = await rootBundle.loadString(dessertPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['dessert'];
      final dessertList =
          jsonList.map((e) => HamburgerDto.fromJson(e)).toList();

      return dessertList;
    } catch (e) {
      throw Exception('dessert.json 로드 실패: $e');
    }
  }

  @override
  Future<List<HamburgerDto>> getDrinkData() async {
    try {
      final jsonString = await rootBundle.loadString(drinkPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['drink'];
      final drinkList = jsonList.map((e) => HamburgerDto.fromJson(e)).toList();

      return drinkList;
    } catch (e) {
      throw Exception('drink.json 로드 실패: $e');
    }
  }
}
