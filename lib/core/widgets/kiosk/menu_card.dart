import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';
import 'package:team_kiosk/core/state/app_state_notifier.dart';

class MenuCard extends ConsumerWidget {
  final String image;
  final String title;
  final int price;
  final KioskTheme theme;
  final VoidCallback onTap;
  bool? isSelected;

  MenuCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.theme,
    required this.onTap,
    this.isSelected
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.read(appStateProvider);
    final styles = ref.watch(textStyleSetProvider);
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        width: double.infinity,
        // 전체 높이 고정
        decoration: ButtonStyles.kioskButton(Colors.white).copyWith(
            border: Border.all(
                color: isSelected == true ? theme.primary : Colors.transparent,
                width: isSelected == null ? 0 : 1
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지가 2/3 차지
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              // 텍스트 영역이 1/3 차지
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        title,
                        style: styles.headline2,
                        maxLines: 2,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            '₩ ${price.toString()}',
                            style: styles.accent,
                            maxLines: 1,
                            minFontSize: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: AutoSizeText(
                            '단품/세트',
                            style: styles.caption,
                            maxLines: 1,
                            minFontSize: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}