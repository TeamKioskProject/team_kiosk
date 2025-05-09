import 'package:team_kiosk/data/dto/burger_dto.dart';
import 'package:team_kiosk/data/model/burger.dart';

extension BurgerDtoMapper on BurgerDto {
  Burger toBurger() {
    return Burger(
      name: menuComponents ?? '',
      imageUrl: menuImgPath ?? '',
      price: price ?? 0,
    );
  }
}
