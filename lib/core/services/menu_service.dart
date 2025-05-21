import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/menu_item.dart';

class Menu {
  final String name;
  final String imageUrl;
  final int price;
  final String? description;

  Menu({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.description,
  });
}

class MenuService extends StateNotifier<AsyncValue<List<Menu>>> {
  MenuService() : super(const AsyncValue.loading()) {
    loadMenus();
  }

  Future<void> loadMenus() async {
    try {
      // TODO: 실제 API 호출로 대체
      await Future.delayed(const Duration(seconds: 1));
      state = AsyncValue.data([
        Menu(
          name: '아메리카노',
          imageUrl: 'assets/images/americano.jpg',
          price: 4500,
          description: '깔끔한 아메리카노',
        ),
        Menu(
          name: '카페라떼',
          imageUrl: 'assets/images/latte.jpg',
          price: 5000,
          description: '부드러운 카페라떼',
        ),
        Menu(
          name: '카푸치노',
          imageUrl: 'assets/images/cappuccino.jpg',
          price: 5000,
          description: '크리미한 카푸치노',
        ),
      ]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final menuServiceProvider =
    StateNotifierProvider<MenuService, AsyncValue<List<Menu>>>((ref) {
      return MenuService();
    });

class MenuNotifier extends StateNotifier<MenuState> {
  MenuNotifier() : super(MenuState());

  void selectMenuItem(MenuItem item) {
    state = state.copyWith(selectedMenuItem: item, selectedOptions: []);
  }

  void toggleOption(MenuItemOption option) {
    final currentOptions = List<MenuItemOption>.from(state.selectedOptions);
    final index = currentOptions.indexWhere((o) => o.id == option.id);

    if (index >= 0) {
      currentOptions.removeAt(index);
    } else {
      currentOptions.add(option);
    }

    state = state.copyWith(selectedOptions: currentOptions);
  }

  bool isOptionSelected(String optionId) {
    return state.selectedOptions.any((option) => option.id == optionId);
  }

  int get selectedOptionsTotalPrice {
    return state.selectedOptions.fold(0, (sum, option) => sum + option.price);
  }

  int get totalPrice {
    if (state.selectedMenuItem == null) return 0;
    return state.selectedMenuItem!.price + selectedOptionsTotalPrice;
  }

  Future<void> loadMenuItems() async {
    // TODO: 실제 API 호출로 대체
    final items = [
      MenuItem(
        id: '1',
        title: '아메리카노',
        description: '깔끔한 에스프레소 샷과 물의 조화',
        imageUrl: 'assets/icons/image_1.png',
        price: 4500,
        tags: ['커피', '핫'],
        options: [
          MenuItemOption(
            id: 'opt1',
            title: '샷 추가',
            description: '에스프레소 샷 1개 추가',
            price: 500,
          ),
          MenuItemOption(
            id: 'opt2',
            title: '시럽 추가',
            description: '바닐라 시럽 1펌프 추가',
            price: 500,
          ),
        ],
      ),
      MenuItem(
        id: '2',
        title: '카페라떼',
        description: '부드러운 우유와 에스프레소의 조화',
        imageUrl: 'assets/icons/image_1.png',
        price: 5000,
        tags: ['커피', '핫', '우유'],
        options: [
          MenuItemOption(
            id: 'opt3',
            title: '샷 추가',
            description: '에스프레소 샷 1개 추가',
            price: 500,
          ),
          MenuItemOption(
            id: 'opt4',
            title: '우유 변경',
            description: '일반 우유를 저지방 우유로 변경',
            price: 500,
          ),
        ],
      ),
    ];

    state = state.copyWith(menuItems: items);
  }
}

class MenuState {
  final List<MenuItem> menuItems;
  final MenuItem? selectedMenuItem;
  final List<MenuItemOption> selectedOptions;

  MenuState({
    this.menuItems = const [],
    this.selectedMenuItem,
    this.selectedOptions = const [],
  });

  MenuState copyWith({
    List<MenuItem>? menuItems,
    MenuItem? selectedMenuItem,
    List<MenuItemOption>? selectedOptions,
  }) {
    return MenuState(
      menuItems: menuItems ?? this.menuItems,
      selectedMenuItem: selectedMenuItem ?? this.selectedMenuItem,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }
}

final menuProvider = StateNotifierProvider<MenuNotifier, MenuState>((ref) {
  return MenuNotifier();
});
