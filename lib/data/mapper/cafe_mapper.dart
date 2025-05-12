import 'package:team_kiosk/data/dto/cafe_dto.dart';
import 'package:team_kiosk/data/model/cafe.dart';

extension CafeDtoMapper on CafeDto {
  Cafe toCafe() {
    return Cafe(name: name ?? '', imageUrl: image ?? '', price: price ?? 0);
  }
}
