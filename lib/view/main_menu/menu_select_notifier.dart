import 'package:riverpod/riverpod.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/repository/repository_provider.dart';
import 'package:team_kiosk/domain/repository/order_repository.dart';
import 'package:team_kiosk/view/main_menu/menu_select.dart';
import 'package:team_kiosk/view/main_menu/menu_state.dart';

class MenuSelectNotifier extends Notifier<AsyncValue<MenuState>> {
  late final OrderRepository _orderRepository;
  late final AppState _appState;

  @override
  AsyncValue<MenuState> build() {
    // OrderRepository와 AppState 주입
    _orderRepository = ref.read(orderRepositoryProvider);
    _appState = ref.read(appStateProvider);

    // 초기 데이터 로딩
    _loadInitialData();
    return const AsyncValue.loading();
  }

  Future<void> _loadInitialData() async {
    try {
      if (_appState.mode == AppMode.burger) {
        state = AsyncValue.data(MenuState(selectTab: MenuSelect.mainMenu));
        await _loadMenuItems(CategoryType.buger);
      } else {
        state = AsyncValue.data(MenuState(selectTab: MenuSelect.mainMenu));
        await _loadMenuItems(CategoryType.cafeDrink);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> changeMode({required int index}) async {
    try {
      if (_appState.mode == AppMode.burger) {
        switch (index) {
          case 0:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.mainMenu),
            );
            await _loadMenuItems(CategoryType.buger);
            break;
          case 1:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.sideMenu),
            );
            await _loadMenuItems(CategoryType.bugerSide);
            break;
          case 2:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.drinkMenu),
            );
            await _loadMenuItems(CategoryType.bugerDrink);
            break;
          case 3:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.dessertMenu),
            );
            await _loadMenuItems(CategoryType.bugerDessert);
            break;
          default:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.mainMenu),
            );
            await _loadMenuItems(CategoryType.buger);
        }
      } else {
        switch (index) {
          case 0:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.mainMenu),
            );
            await _loadMenuItems(CategoryType.cafeDrink);
            break;
          case 1:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.dessertMenu),
            );
            await _loadMenuItems(CategoryType.cafeDessert);
            break;
          default:
            state = AsyncValue.data(
              state.requireValue.copyWith(selectTab: MenuSelect.mainMenu),
            );
            await _loadMenuItems(CategoryType.cafeDrink);
        }
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> _loadMenuItems(CategoryType type) async {
    try {
      final items = await _orderRepository.getOrderItem(type: type);
      state = AsyncValue.data(
        state.requireValue.copyWith(itemList: items),
      );
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final menuSelectNotifierProvider =
NotifierProvider<MenuSelectNotifier, AsyncValue<MenuState>>(
  MenuSelectNotifier.new,
);