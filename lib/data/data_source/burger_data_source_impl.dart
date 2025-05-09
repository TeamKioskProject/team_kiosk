import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:team_kiosk/data/data_source/burger_data_source.dart';
import 'package:team_kiosk/domain/hamburger/hamburger_menu_model.dart';

class BurgerDataSourceImpl implements BurgerDataSource {
  static const String path = 'lib/data/data/burger_mock_data.json';

  @override
  Future<List<HamburgerMenuModel>> getBurgerData() async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      final List<dynamic> jsonList = jsonResponse['burgers'];
      final burgerList =
          jsonList.map((e) => HamburgerMenuModel.fromJson(e)).toList();

      return burgerList;
    } catch (e) {
      throw Exception('burger.json 로드 실패: $e');
    }
  }
}
