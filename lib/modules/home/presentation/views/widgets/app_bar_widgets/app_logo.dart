import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        onEnter: (_) => setState(() => hovered = true),
        onExit: (_) => setState(() => hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: hovered
                  ? ColorPallet.skyColor.withValues(alpha: 0.70)
                  : ColorPallet.white.withValues(alpha: 0.12),
              width: 1.5,
            ),
            color:
                ColorPallet.mainPirpel.withValues(alpha: hovered ? 0.22 : 0.14),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: ColorPallet.skyColor.withValues(alpha: 0.20),
                      blurRadius: 22,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ColorPallet.pink
                        .withValues(alpha: hovered ? 0.95 : 0.55),
                    width: 1.6,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorPallet.pink.withValues(alpha: 0.9),
                      ColorPallet.mainPirpel.withValues(alpha: 0.9),
                      ColorPallet.darkGreen.withValues(alpha: 0.9),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "WA",
                    style: AppStyles.styleBold12(context).copyWith(
                      color: ColorPallet.white,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Waheed",
                style: AppStyles.styleLogo(context).copyWith(
                  color: ColorPallet.white,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "Ashraf",
                style: AppStyles.styleLogo(context).copyWith(
                  color: hovered
                      ? ColorPallet.skyColor
                      : ColorPallet.white.withValues(alpha: 0.85),
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
