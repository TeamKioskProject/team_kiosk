import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_kiosk/data/model/order_item.dart';
import 'package:team_kiosk/view/main_menu/menu_select.dart';
part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  final MenuSelect selectTab;
  final List<OrderItem> itemList;
  const MenuState({
    this.selectTab = MenuSelect.mainMenu,
    this.itemList = const [],
  });
}
