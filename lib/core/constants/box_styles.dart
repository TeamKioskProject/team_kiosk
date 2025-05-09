import 'package:flutter/material.dart';

abstract class ButtonStyles {
  static BoxDecoration kioskButton(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(30),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  static ButtonStyle categoryButton(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 10,
      shadowColor: Colors.black.withAlpha(30),
    );
  }
}
