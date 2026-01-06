import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = hovered
        ? ColorPallet.skyColor
        : ColorPallet.white.withValues(alpha: 0.85);

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 160),
                style: AppStyles.styleSemiBold16(context).copyWith(
                  color: color,
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                height: 2,
                width: hovered ? 26 : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: ColorPallet.skyColor.withValues(alpha: 0.95),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
