import 'package:team_kiosk/data/dto/dessert_dto.dart';
import 'package:team_kiosk/data/model/dessert.dart';

extension DessertMapper on DessertDto {
  Dessert toDessert() {
    return Dessert(
      name: menuComponents ?? '',
      imageUrl: menuImgPath ?? '',
      price: price ?? 0,
    );
  }
}
