class MenuItem {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int price;
  final List<String> tags;
  final List<MenuItemOption> options;

  MenuItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.tags = const [],
    this.options = const [],
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
      tags: List<String>.from(json['tags'] ?? []),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => MenuItemOption.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'tags': tags,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }
}

class MenuItemOption {
  final String id;
  final String title;
  final String? description;
  final int price;
  final bool isSelected;

  MenuItemOption({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.isSelected = false,
  });

  factory MenuItemOption.fromJson(Map<String, dynamic> json) {
    return MenuItemOption(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      price: json['price'] as int,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'isSelected': isSelected,
    };
  }

  MenuItemOption copyWith({
    String? id,
    String? title,
    String? description,
    int? price,
    bool? isSelected,
  }) {
    return MenuItemOption(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
    );
  }
} 