import 'package:team_kiosk/data/dto/hamburger_dto.dart';
import 'package:team_kiosk/data/model/burger.dart';

extension HambugerMapper on HamburgerDto {
  Burger toHamBurger() {
    return Burger(
      name: menuComponents ?? '',
      imageUrl: menuImgPath ?? '',
      price: price ?? 0,
    );
  }
}
