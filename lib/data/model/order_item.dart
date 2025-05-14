
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
part 'order_item.freezed.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required KioskMode theme,
    required String id,
    required CategoryType category,
    required String name,
    required String imageUrl,
    required int price,
}) = _OrderItem;
}