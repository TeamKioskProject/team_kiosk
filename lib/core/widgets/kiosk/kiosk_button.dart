import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/widgets/kiosk/category_card.dart' as kiosk;

@immutable
class Kioskbutton extends ConsumerWidget {
  final String text;
  final KioskTheme theme;
  final kiosk.Category category;

  const Kioskbutton({
    super.key,
    required this.text,
    required this.theme,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(textStyleSetProvider);

    String imagePath;
    switch (category) {
      case kiosk.Category.burger:
        imagePath = 'assets/icons/chat_bubble.png'; // Image for burger category
        break;
      case kiosk.Category.cafe:
        imagePath =
            'assets/icons/chat_bubble_cafe.png'; // Image for cafe category
        break; // Default image if needed
    }
    return ColumnSuper(
      alignment: Alignment.topLeft,
      invert: true,
      innerDistance: -20,
      children: [
        Image.asset(imagePath, width: 60, height: 40),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: ButtonStyles.kioskButton(Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 50,
                top: 30,
                bottom: 20,
              ),
              child: Text(
                text,
                style: styles.headline1.copyWith(fontSize: 25),
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
