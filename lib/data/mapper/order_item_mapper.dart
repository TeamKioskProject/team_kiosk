import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/dto/buger_type_dto.dart';
import 'package:team_kiosk/data/dto/cafe_type_dto.dart';
import 'package:team_kiosk/data/model/order_item.dart';

extension BugerOrderItemMapper on BugerTypeDto {
  OrderItem toOrderItemBuger({required CategoryType type}) {
    return OrderItem(
      theme: KioskMode.burger,
      id: menuCd ?? '',
      category: type,
      name: menuNm ?? '',
      imageUrl: menuImgThumPath ?? '',
      price: price ?? 0,
    );
  }
}

extension CafeOrderItemMapper on CafeTypeDto {
  OrderItem toOrderItemCafe({required CategoryType type}) {
    return OrderItem(
      theme: KioskMode.cafe,
      id: id ?? '',
      category: type,
      name: name ?? '',
      imageUrl: image ?? '',
      price: price ?? 0,
    );
  }
}
