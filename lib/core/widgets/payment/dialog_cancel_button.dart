import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';

@immutable
class DialogCancelButton extends StatelessWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onTapEvent;

  const DialogCancelButton({
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
      borderRadius: BorderRadius.circular(16),
      elevation: 3,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onTapEvent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child:
                icon == null
                    ? Center(
                      child: Text(
                        text,
                        style: textStyleSet.headline2,
                        textAlign: TextAlign.center,
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, color: iconColor ?? Colors.white),
                        const SizedBox(width: 10),
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
