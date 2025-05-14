import 'package:auto_size_text/auto_size_text.dart';
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
  final String itemId;
  final int itemQuantity;
  final void Function(String id) onAddTap;
  final void Function(String id) onRemoveTap;
  final void Function(String id) onMinusTap;

  const OrderSummaryBox({
    super.key,
    required this.theme,
    required this.textStyleSet,
    required this.itemName,
    required this.itemPrice,
    required this.itemId,
    required this.itemImage,
    required this.itemQuantity,
    required this.onAddTap,
    required this.onRemoveTap,
    required this.onMinusTap,
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
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 12,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 90, child: Image.network(widget.itemImage)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  widget.itemName,
                                  style: widget.textStyleSet.headline2,
                                  maxLines: 2,
                                  minFontSize: 12,
                                  overflow:
                                      TextOverflow
                                          .ellipsis, // visible → ellipsis
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${widget.itemPrice}원',
                                  style: widget.textStyleSet.caption,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.onRemoveTap(widget.itemId);
                            },
                            icon: const Icon(
                              Icons.restore_from_trash,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
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
                            widget.onMinusTap(widget.itemId);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  widget.itemQuantity <= 1
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
                        Text(
                          widget.itemQuantity.toString(),
                          style: widget.textStyleSet.body,
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            widget.onAddTap(widget.itemId);
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
