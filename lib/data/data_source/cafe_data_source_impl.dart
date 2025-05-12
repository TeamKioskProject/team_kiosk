import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/cafe_data_source.dart';
import 'package:team_kiosk/data/dto/cafe_dto.dart';

class CafeDataSourceImpl implements CafeDataSource {
  static const String dessertPath = 'lib/data/data/starbucks_desserts.json';
  static const String drinkPath = 'lib/data/data/starbucks_drinks_trimmed.json';

  @override
  Future<List<CafeDto>> getDessertData() async {
    try {
      final jsonString = await rootBundle.loadString(dessertPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['desserts'];
      final dessertsList = jsonList.map((e) => CafeDto.fromJson(e)).toList();

      return dessertsList;
    } catch (e) {
      throw Exception('dessert.json 로드 실패: $e');
    }
  }

  @override
  Future<List<CafeDto>> getDrinkData() async {
    try {
      final jsonString = await rootBundle.loadString(drinkPath);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['beverage'];
      final drinksList = jsonList.map((e) => CafeDto.fromJson(e)).toList();

      return drinksList;
    } catch (e) {
      throw Exception('drinks.json 로드 실패: $e');
    }
  }
}
