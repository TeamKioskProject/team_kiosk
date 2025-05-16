import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

@freezed
class IngredientState with _$IngredientState {
  final List<Map<String, dynamic>> cafeOptions;

  final List<Map<String, dynamic>> burgerOptions;

  const IngredientState({
    this.cafeOptions = const [
      {
        "name": "에스프레소 샷 추가",
        "icon": Icons.coffee,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "바닐라 시럽",
        "icon": Icons.icecream,
        "color": Colors.amber,
        "isSelected": false,
      },
      {
        "name": "카라멜 시럽",
        "icon": Icons.icecream,
        "color": Colors.orange,
        "isSelected": false,
      },
      {
        "name": "헤이즐넛 시럽",
        "icon": Icons.icecream,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "휘핑 크림",
        "icon": Icons.cloud,
        "color": Colors.white,
        "isSelected": false,
      },
      {
        "name": "오트 밀크",
        "icon": Icons.grain,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "아몬드 밀크",
        "icon": Icons.spa,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "두유",
        "icon": Icons.grass,
        "color": Colors.green,
        "isSelected": false,
      },
      {
        "name": "콜드 폼",
        "icon": Icons.ac_unit,
        "color": Colors.lightBlue,
        "isSelected": false,
      },
      {
        "name": "꿀",
        "icon": Icons.emoji_nature,
        "color": Colors.yellow,
        "isSelected": false,
      },
      {
        "name": "시나몬 파우더",
        "icon": Icons.spa,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "모카 드리즐",
        "icon": Icons.coffee_maker,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "화이트 모카 드리즐",
        "icon": Icons.coffee_maker,
        "color": Colors.white,
        "isSelected": false,
      },
      {
        "name": "초코 칩",
        "icon": Icons.cookie,
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "말차 파우더",
        "icon": Icons.grass,
        "color": Colors.green,
        "isSelected": false,
      },
      {
        "name": "아이스크림 스쿱",
        "icon": Icons.icecream,
        "color": Colors.white,
        "isSelected": false,
      },
    ],
    this.burgerOptions = const [
      {
        "name": "베이컨",
        "icon": 'assets/ingredient/bacon.png',
        "color": Colors.red,
        "isSelected": false,
      },
      {
        "name": "피클",
        "icon": 'assets/ingredient/pickle.png',
        "color": Colors.green,
        "isSelected": false,
      },
      {
        "name": "토마토",
        "icon": 'assets/ingredient/tomato.png',
        "color": Colors.red,
        "isSelected": false,
      },
      {
        "name": "할라피뇨",
        "icon": 'assets/ingredient/jalapeno.png',
        "color": Colors.green,
        "isSelected": false,
      },
      {
        "name": "버섯",
        "icon": 'assets/ingredient/mushroom.png',
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "아보카도",
        "icon": 'assets/ingredient/avocado.png',
        "color": Colors.green,
        "isSelected": false,
      },
      {
        "name": "프라이드 에그",
        "icon": 'assets/ingredient/fried_egg.png',
        "color": Colors.yellow,
        "isSelected": false,
      },
      {
        "name": "바비큐 소스",
        "icon": 'assets/ingredient/bbq.png',
        "color": Colors.red,
        "isSelected": false,
      },
      {
        "name": "치폴레 소스",
        "icon": 'assets/ingredient/chipotle.png',
        "color": Colors.orange,
        "isSelected": false,
      },
      {
        "name": "랜치 소스",
        "icon": 'assets/ingredient/ranch.png',
        "color": Colors.white,
        "isSelected": false,
      },
      {
        "name": "칠리 소스",
        "icon": 'assets/ingredient/chili.png',
        "color": Colors.red,
        "isSelected": false,
      },
      {
        "name": "파인애플 슬라이스",
        "icon": 'assets/ingredient/pineapple.png',
        "color": Colors.yellow,
        "isSelected": false,
      },
      {
        "name": "더블 패티",
        "icon": 'assets/ingredient/patty.png',
        "color": Colors.brown,
        "isSelected": false,
      },
      {
        "name": "볶은 피망",
        "icon": 'assets/ingredient/green_pepper.png',
        "color": Colors.red,
        "isSelected": false,
      },
      {
        "name": "추가 케첩",
        "icon": 'assets/ingredient/ketchup.png',
        "color": Colors.red,
        "isSelected": false,
      },
      {
        "name": "머스타드",
        "icon": 'assets/ingredient/mustard.png',
        "color": Colors.yellow,
        "isSelected": false,
      },
    ],
  });
}
