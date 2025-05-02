import 'package:flutter/material.dart';

class DemoTestScreen extends StatelessWidget {
  const DemoTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [
      ElevatedButton(onPressed: (){}, child: Text("햄버거 테마")),
      ElevatedButton(onPressed: (){}, child: Text("카페 테마")),
      ElevatedButton(onPressed: (){}, child: Text("배리어 프리 모드 활성화")),
      ElevatedButton(onPressed: (){}, child: Text("배리어 프리 모드 비활성화"))
    ])));
  }
}
