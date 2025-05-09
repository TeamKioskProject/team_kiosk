import 'dart:convert';
import 'dart:io';

import 'package:team_kiosk/data/data_source/burger_data_source.dart';
import 'package:team_kiosk/domain/hamburger/hamburger_menu_model.dart';

class BurgerDataSourceImpl implements BurgerDataSource {
  static const String path = 'lib/data/data/burger_mock_data.json';

  @override
  Future<List<HamburgerMenuModel>> getBurgerData() async {
    try {
      final File file = File(path);
      final jsonFile = await file.readAsString();
      List<dynamic> json = jsonDecode(jsonFile);
      final burgerList =
          json.map((e) => HamburgerMenuModel.fromJson(e)).toList();
      return burgerList;
    } catch (e) {
      throw Exception('haru.json 로드 실패 $e');
    }
  }
}
