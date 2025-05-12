import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/hamburger_data_source.dart';
import 'package:team_kiosk/data/dto/burger_dto.dart';

class BurgerDataSourceImpl implements HamburgerDataSource {
  static const String path = 'lib/data/data/burger_mock_data.json';

  @override
  Future<List<BurgerDto>> getBurgerData() async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['burgers'];
      final burgerList = jsonList.map((e) => BurgerDto.fromJson(e)).toList();

      return burgerList;
    } catch (e) {
      throw Exception('burger.json 로드 실패: $e');
    }
  }
}
