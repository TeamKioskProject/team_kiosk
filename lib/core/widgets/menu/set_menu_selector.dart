import 'package:flutter/material.dart';

class SetMenuSelector extends StatelessWidget {
  final String mainName;
  final String mainPrice;
  final String mainImage;
  final List<SetMenuOption> sides;
  final List<SetMenuOption> drinks;
  final int selectedSide;
  final int selectedDrink;
  final VoidCallback onComplete;
  final void Function(int) onSelectSide;
  final void Function(int) onSelectDrink;

  const SetMenuSelector({
    super.key,
    required this.mainName,
    required this.mainPrice,
    required this.mainImage,
    required this.sides,
    required this.drinks,
    required this.selectedSide,
    required this.selectedDrink,
    required this.onComplete,
    required this.onSelectSide,
    required this.onSelectDrink,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: 380,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color: const Color(0xFFFDF6F0),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              // 1. 상단 AppBar 분리
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black54),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '세트 구성',
                      style: TextStyle(
                        color: Color(0xFFEA580C),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.volume_up, color: Colors.black54),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // 2. 안내(진행 단계) 영역 분리
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEA580C),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '세트 구성을 선택해주세요',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              ),
              // 3. 나머지 영역(스크롤)
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 메인 메뉴 카드
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: mainImage.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(mainImage, width: 80, height: 80, fit: BoxFit.cover),
                                    )
                                  : const Text('IMG\n80×80', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mainName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    mainPrice,
                                    style: const TextStyle(
                                      color: Color(0xFFEA580C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 사이드 메뉴 선택
                      const Text(
                        '사이드 메뉴 선택',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(sides.length, (i) {
                          final option = sides[i];
                          final selected = i == selectedSide;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => onSelectSide(i),
                              child: Container(
                                margin: EdgeInsets.only(right: i == sides.length - 1 ? 0 : 12),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: selected ? const Color(0xFFEA580C) : Colors.grey.shade200,
                                    width: selected ? 2 : 1,
                                  ),
                                  boxShadow: [
                                    if (selected)
                                      BoxShadow(
                                        color: const Color(0xFFEA580C).withOpacity(0.08),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: option.image.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(option.image, width: 80, height: 80, fit: BoxFit.cover),
                                            )
                                          : Text('IMG\n${option.imgSize}', textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(option.label, style: const TextStyle(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 24),
                      // 음료 선택
                      const Text(
                        '음료 선택',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(drinks.length, (i) {
                          final option = drinks[i];
                          final selected = i == selectedDrink;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => onSelectDrink(i),
                              child: Container(
                                margin: EdgeInsets.only(right: i == drinks.length - 1 ? 0 : 12),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: selected ? const Color(0xFFEA580C) : Colors.grey.shade200,
                                    width: selected ? 2 : 1,
                                  ),
                                  boxShadow: [
                                    if (selected)
                                      BoxShadow(
                                        color: const Color(0xFFEA580C).withOpacity(0.08),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: option.image.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(option.image, width: 80, height: 80, fit: BoxFit.cover),
                                            )
                                          : Text('IMG\n${option.imgSize}', textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(option.label, style: const TextStyle(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              // 하단 버튼 고정
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEA580C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    onPressed: onComplete,
                    child: const Text(
                      '선택 완료',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SetMenuOption {
  final String label;
  final String image;
  final String imgSize; // 예: '127×128'

  SetMenuOption({
    required this.label,
    required this.image,
    required this.imgSize,
  });
} 