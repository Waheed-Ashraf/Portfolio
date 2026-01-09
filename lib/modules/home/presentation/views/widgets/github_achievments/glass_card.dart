import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: ColorPallet.pink.withValues(alpha: 0.45),
          width: 2,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorPallet.mainPirpel,
            ColorPallet.darkGreen,
            ColorPallet.mainPirpel,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: ColorPallet.pink.withValues(alpha: 0.18),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
