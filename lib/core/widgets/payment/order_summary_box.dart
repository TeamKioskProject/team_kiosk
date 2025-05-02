import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';
import 'package:team_kiosk/core/constants/theme_provider.dart';

class OrderSummaryBox extends StatefulWidget {
  final KioskTheme theme;
  final TextStyleSet textStyleSet;
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final int itemQuantity;

  OrderSummaryBox({
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
  num count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.itemQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ButtonStyles.kioskButton(Colors.white),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(16),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x1A000000), // 000000 with 10% opacity
      //       offset: Offset(0, 2), // X: 0, Y: 2
      //       blurRadius: 4, // Blur: 4
      //       spreadRadius: 0, // Spread: 0
      //     ),
      //   ],
      // ),
      child: Column(
        spacing: 0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.restore_from_trash),
            ),
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // color: widget.theme.secondary,
                width: 80,
                // height: 80,
                child: Image.network(widget.itemImage, ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.itemName, style: widget.textStyleSet.headline2),
                  Text(
                    '${widget.itemPrice}원',
                    style: widget.textStyleSet.caption,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('수량', style: widget.textStyleSet.body),
              ),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (count > 0) {
                        setState(() {
                          count = count - 1;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            count <= 1
                                ? Colors.grey[400]
                                : widget.theme.primary,
                      ),
                      child: const Icon(Icons.remove, color: Colors.white, size: 16,),
                    ),
                  ),
                  Text(count.toString(), style: widget.textStyleSet.body),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count = count + 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.theme.primary,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 16,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
