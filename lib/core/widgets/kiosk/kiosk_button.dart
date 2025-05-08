import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';


@immutable
class Kioskbutton extends ConsumerWidget {
  final String text;
  final KioskTheme theme;
  final TextStyleSet textStyleSet;

  const Kioskbutton({
    super.key,
    required this.text,
    required this.theme,
    required this.textStyleSet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColumnSuper(
      outerDistance: 30,
      alignment: Alignment.topLeft,
      invert: true,
      innerDistance: -20,
      children: [
        Image.asset('assets/icons/chat_bubble.png', width: 60, height: 40),
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
                style: textStyleSet.headline1.copyWith(fontSize: 25),
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
