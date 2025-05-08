import 'package:flutter/material.dart';

class IngredientSelector extends StatelessWidget {
  const IngredientSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.deepOrange),
        title: const Text('재료 선택', style: TextStyle(color: Colors.deepOrange)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Icon(Icons.volume_up, color: Colors.grey),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 햄버거 이미지
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/burger.jpg'), // 실제 이미지 경로로 교체
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 24),
            // 안내 카드
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                child: Column(
                  children: const [
                    Text('햄버거 재료를 변경할까요?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 8),
                    Text('원하시는 재료를 선택해주세요', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 재료 리스트 (토글)
            _ingredientTile('양상추', Icons.eco, true),
            _ingredientTile('토마토', Icons.brightness_1, false, iconColor: Colors.redAccent),
            _ingredientTile('치즈', Icons.lunch_dining, true, iconColor: Colors.amber),
            _ingredientTile('치즈소스', Icons.opacity, true, iconColor: Colors.orangeAccent),
            const Spacer(),
            // 선택 완료 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                onPressed: () {},
                child: const Text('선택 완료', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _ingredientTile(String name, IconData icon, bool selected, {Color? iconColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.green, size: 32),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Switch(
          value: selected,
          onChanged: null, // UI만, 동작 없음
          activeColor: Colors.green,
        ),
      ),
    );
  }
} 