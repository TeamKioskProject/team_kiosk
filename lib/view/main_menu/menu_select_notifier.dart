import 'package:riverpod/riverpod.dart';
import 'package:team_kiosk/core/state/app_mode.dart';
import 'package:team_kiosk/core/state/app_state.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/repository/repository_provider.dart';
import 'package:team_kiosk/domain/repository/order_repository.dart';
import 'package:team_kiosk/view/main_menu/menu_select.dart';
import 'package:team_kiosk/view/main_menu/menu_state.dart';

class MenuSelectNotifier extends Notifier<MenuState> {
  late final OrderRepository _orderRepository;

  @override
  MenuState build() {
    // OrderRepository 주입
    _orderRepository = ref.read(orderRepositoryProvider);
    _loadInitialData();
    return const MenuState();
  }

  void resetState() {
    state = const MenuState(); // 상태 초기화
    _loadInitialData(); // 초기 데이터 다시 로드
  }

  Future<void> _loadInitialData() async {
    final appState = ref.read(appStateProvider);

    // 초기 데이터 로딩을 비동기로 처리
    await Future.delayed(Duration.zero, () async {
      state = state.copyWith(itemList: []);
      await changeTab(appStateMode: appState);
    });
  }

  void changeMode({required AppState appStateMode, required int index}) async {
    resetState(); // 상태 초기화 추가
    if (appStateMode.mode == AppMode.burger) {
      switch (index) {
        case 0:
          state = state.copyWith(selectTab: MenuSelect.mainMenu);
          await changeTab(appStateMode: appStateMode);
          break;
        case 1:
          state = state.copyWith(selectTab: MenuSelect.sideMenu);
          await changeTab(appStateMode: appStateMode);
          break;
        case 2:
          state = state.copyWith(selectTab: MenuSelect.drinkMenu);
          await changeTab(appStateMode: appStateMode);
          break;
        case 3:
          state = state.copyWith(selectTab: MenuSelect.dessertMenu);
          await changeTab(appStateMode: appStateMode);
          break;

        default:
          state = state.copyWith(selectTab: MenuSelect.mainMenu);
          await changeTab(appStateMode: appStateMode);
      }
    } else {
      switch (index) {
        case 0:
          state = state.copyWith(selectTab: MenuSelect.mainMenu);
          await changeTab(appStateMode: appStateMode);
          break;
        case 1:
          state = state.copyWith(selectTab: MenuSelect.dessertMenu);
          await changeTab(appStateMode: appStateMode);
          break;
      }
    }

    // await changeTab(theme: theme);
  }

  Future<void> changeTab({required AppState appStateMode}) async {
    if (appStateMode.mode == AppMode.burger) {
      switch (state.selectTab) {
        case MenuSelect.mainMenu:
          final data = await _orderRepository.getOrderItem(
            type: CategoryType.burger,
          );
          state = state.copyWith(itemList: data);
        case MenuSelect.sideMenu:
          final data = await _orderRepository.getOrderItem(
            type: CategoryType.burgerSide,
          );
          state = state.copyWith(itemList: data);
        case MenuSelect.drinkMenu:
          final data = await _orderRepository.getOrderItem(
            type: CategoryType.burgerDrink,
          );
          state = state.copyWith(itemList: data);
        case MenuSelect.dessertMenu:
          final data = await _orderRepository.getOrderItem(
            type: CategoryType.burgerDessert,
          );
          state = state.copyWith(itemList: data);
      }
    } else {
      switch (state.selectTab) {
        case MenuSelect.mainMenu:
          final data = await _orderRepository.getOrderItem(
            type: CategoryType.cafeDrink,
          );
          state = state.copyWith(itemList: data);
        case MenuSelect.sideMenu:
          // TODO: Handle this case.
          throw UnimplementedError();
        case MenuSelect.drinkMenu:
          // TODO: Handle this case.
          throw UnimplementedError();
        case MenuSelect.dessertMenu:
          final data = await _orderRepository.getOrderItem(
            type: CategoryType.cafeDessert,
          );
          state = state.copyWith(itemList: data);
      }
    }
  }
}

final menuSelectNotifierProvider =
    NotifierProvider<MenuSelectNotifier, MenuState>(MenuSelectNotifier.new);
