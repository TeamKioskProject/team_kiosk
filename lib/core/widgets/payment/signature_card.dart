import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:team_kiosk/core/constants/app_colors.dart';
import 'package:team_kiosk/core/constants/app_texts.dart';
import 'package:team_kiosk/core/constants/box_styles.dart';

class SignatureCard extends StatelessWidget {
  final KioskTheme theme;
  final TextStyleSet styles;
  const SignatureCard({super.key, required this.theme, required this.styles});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ButtonStyles.kioskButton(Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("서명을 해주세요", style: styles.headline2),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.subText),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SfSignaturePad(key: _signaturePadKey),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                _signaturePadKey.currentState?.clear();
              },
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.lock_reset_outlined), Text('다시하기', style: styles.caption,)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
