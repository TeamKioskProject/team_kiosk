import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';
import 'package:team_kiosk/data/data_source/data_type.dart';
import 'package:team_kiosk/data/repository/repository_provider.dart';
import 'package:team_kiosk/domain/repository/order_repository.dart';
import 'package:team_kiosk/view/set_builder/set_builder_state.dart';

class SetBuilderNotification extends Notifier<SetBuilderState> {
  late final OrderRepository _orderRepository;

  @override
  SetBuilderState build() {
    _orderRepository = ref.read(orderRepositoryProvider);
    _loadInitialData();
    return const SetBuilderState();
  }

  void selectSideMenu({required String name, required String uri}) {
    state = state.copyWith(selectSideMenu: name, selectSideImage: uri);
  }

  void selectDrinkMenu({required String name, required String uri}) {
    state = state.copyWith(selectDrink: name, selectDrinkImage: uri);
  }

  Future<void> _loadInitialData() async {
    final appState = ref.read(appStateProvider);

    // 초기 데이터 로딩을 비동기로 처리
    await Future.delayed(Duration.zero, () async {
      state = state.copyWith(drinkMenuList: [], sideMenuList: []);
      await changeTab();
    });
  }

  Future<void> changeTab() async {
    final drinkData = await _orderRepository.getOrderItem(
      type: CategoryType.burgerDrink,
    );

    final sideData = await _orderRepository.getOrderItem(
      type: CategoryType.burgerSide,
    );

    state = state.copyWith(drinkMenuList: drinkData, sideMenuList: sideData);
  }
}

final setBuilderProvider =
    NotifierProvider<SetBuilderNotification, SetBuilderState>(
      () => SetBuilderNotification(),
    );
