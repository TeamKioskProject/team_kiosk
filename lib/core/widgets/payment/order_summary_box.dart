import 'package:flutter/material.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';

@immutable
class OrderSummaryBox extends StatefulWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final int itemQuantity;

  const OrderSummaryBox({
    super.key,
    required this.theme,
    required this.textStyleSet,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemQuantity,
  });

  @override
  State<OrderSummaryBox> createState() => _OrderSummaryBoxState();
}

class _OrderSummaryBoxState extends State<OrderSummaryBox> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.itemQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                // TODO: 아이템 제거 기능 추가
              },
              icon: const Icon(Icons.restore_from_trash, size: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 80, child: Image.network(widget.itemImage)),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.itemName,
                          style: widget.textStyleSet.headline2,
                        ),
                        Text(
                          '${widget.itemPrice}원',
                          style: widget.textStyleSet.caption,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('수량', style: widget.textStyleSet.body),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (count > 0) {
                              setState(() {
                                count--;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  count <= 1
                                      ? Colors.grey[400]
                                      : widget.theme.primary,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(count.toString(), style: widget.textStyleSet.body),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.theme.primary,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
