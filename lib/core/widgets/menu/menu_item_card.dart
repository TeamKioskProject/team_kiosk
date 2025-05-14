import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const MenuItemCard({
    Key? key,
    required this.title,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 183,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected ? Colors.deepOrange : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 30,
              color: Colors.grey[300],
              child: const Center(child: Text("IMG")),
            ),
            const SizedBox(height: 120),
            Text(
              title,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
