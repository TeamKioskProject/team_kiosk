import 'package:flutter/material.dart';
import 'package:team_kiosk/core/widgets/menu/burger_card.dart';
import 'package:team_kiosk/core/widgets/menu/menu_item_card.dart';

class SetSelectionPage extends StatefulWidget {
  const SetSelectionPage({super.key});

  @override
  State<SetSelectionPage> createState() => _SetSelectionPageState();
}

class _SetSelectionPageState extends State<SetSelectionPage> {
  int selectedSideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          '세트 구성',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.volume_up, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '세트 구성을 선택해주세요',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const BurgerCard(name: '치즈버거', price: '6,900원'),
            const SizedBox(height: 24),

            const Text(
              '사이드 메뉴 선택',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                MenuItemCard(
                  title: '감자튀김',
                  selected: selectedSideIndex == 0,
                  onTap: () => setState(() => selectedSideIndex = 0),
                ),
                const SizedBox(width: 12),
                MenuItemCard(
                  title: '치킨너겟',
                  selected: selectedSideIndex == 1,
                  onTap: () => setState(() => selectedSideIndex = 1),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              '음료 선택',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                MenuItemCard(title: '콜라', selected: true),
                SizedBox(width: 12),
                MenuItemCard(title: '사이다', selected: false),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text('선택 완료', style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }
}
