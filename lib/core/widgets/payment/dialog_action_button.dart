import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';

class DialogActionButton extends StatelessWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final String text;
  IconData? icon;
  Color? iconColor;
  final void Function() onTapEvent;

  DialogActionButton({
    super.key,
    required this.text,
    this.icon,
    this.iconColor,
    required this.onTapEvent,
    required this.theme,
    required this.textStyleSet,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(

          onTap: onTapEvent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child:
                icon == null
                    ? Text(
                      text,
                      style: textStyleSet.headline2,
                      textAlign: TextAlign.center,
                    )
                    : Row(
                      children: [
                        Icon(icon, color: iconColor ?? Colors.white),
                        Text(
                          text,
                          style: textStyleSet.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
