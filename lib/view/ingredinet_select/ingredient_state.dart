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
        "icon": 'assets/ingredient/shot.png',
        "isSelected": false,
      },
      {
        "name": "바닐라 시럽",
        "icon": 'assets/ingredient/vanilla.png',
        "isSelected": false,
      },
      {
        "name": "카라멜 시럽",
        "icon": 'assets/ingredient/caramel.png',
        "isSelected": false,
      },
      {
        "name": "휘핑 크림",
        "icon": 'assets/ingredient/whipp.png',
        "isSelected": false,
      },
      {
        "name": "오트 밀크",
        "icon": 'assets/ingredient/oats.png',
        "isSelected": false,
      },
      {
        "name": "아몬드 밀크",
        "icon": 'assets/ingredient/almond.png',
        "isSelected": false,
      },
      {
        "name": "두유",
        "icon": 'assets/ingredient/soybean.png',
        "isSelected": false,
      },
      {"name": "꿀", "icon": 'assets/ingredient/honey.png', "isSelected": false},
      {
        "name": "시나몬 파우더",
        "icon": 'assets/ingredient/cinnamon.png',
        "isSelected": false,
      },
      {
        "name": "초코 칩",
        "icon": 'assets/ingredient/choco.png',
        "isSelected": false,
      },
      {
        "name": "말차 파우더",
        "icon": 'assets/ingredient/tea.png',
        "isSelected": false,
      },
      {
        "name": "아이스크림 스쿱",
        "icon": 'assets/ingredient/icecream.png',
        "isSelected": false,
      },
    ],
    this.burgerOptions = const [
      {
        "name": "베이컨",
        "icon": 'assets/ingredient/bacon.png',
        "isSelected": false,
      },
      {
        "name": "피클",
        "icon": 'assets/ingredient/pickle.png',
        "isSelected": false,
      },
      {
        "name": "토마토",
        "icon": 'assets/ingredient/tomato.png',
        "isSelected": false,
      },
      {
        "name": "할라피뇨",
        "icon": 'assets/ingredient/jalapeno.png',
        "isSelected": false,
      },
      {
        "name": "버섯",
        "icon": 'assets/ingredient/mushroom.png',
        "isSelected": false,
      },
      {
        "name": "아보카도",
        "icon": 'assets/ingredient/avocado.png',
        "isSelected": false,
      },
      {
        "name": "프라이드 에그",
        "icon": 'assets/ingredient/fried_egg.png',
        "isSelected": false,
      },
      {
        "name": "바비큐 소스",
        "icon": 'assets/ingredient/bbq.png',
        "isSelected": false,
      },
      {
        "name": "치폴레 소스",
        "icon": 'assets/ingredient/chipotle.png',
        "isSelected": false,
      },
      {
        "name": "랜치 소스",
        "icon": 'assets/ingredient/ranch.png',
        "isSelected": false,
      },
      {
        "name": "칠리 소스",
        "icon": 'assets/ingredient/chili.png',
        "isSelected": false,
      },
      {
        "name": "파인애플 슬라이스",
        "icon": 'assets/ingredient/pineapple.png',
        "isSelected": false,
      },
      {
        "name": "더블 패티",
        "icon": 'assets/ingredient/patty.png',
        "isSelected": false,
      },
      {
        "name": "볶은 피망",
        "icon": 'assets/ingredient/green_pepper.png',
        "isSelected": false,
      },
      {
        "name": "추가 케첩",
        "icon": 'assets/ingredient/ketchup.png',
        "isSelected": false,
      },
      {
        "name": "머스타드",
        "icon": 'assets/ingredient/mustard.png',
        "isSelected": false,
      },
    ],
  });
}
