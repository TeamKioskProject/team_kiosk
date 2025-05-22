import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_kiosk/data/model/order_item.dart';
part 'set_builder_state.freezed.dart';

@freezed
class SetBuilderState with _$SetBuilderState {
  final String selectSideMenu;
  final String selectDrink;
  final String selectSideImage;
  final String selectDrinkImage;
  final List<OrderItem> sideMenuList;
  final List<OrderItem> drinkMenuList;

  const SetBuilderState({
    this.selectSideMenu = '',
    this.selectDrink = '',
    this.selectDrinkImage = '',
    this.selectSideImage = '',
    this.sideMenuList = const [],
    this.drinkMenuList = const [],
  });
}
