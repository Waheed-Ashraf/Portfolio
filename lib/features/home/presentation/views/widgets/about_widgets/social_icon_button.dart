import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.accent,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? accent;
  final String? tooltip;

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.accent ?? ColorPallet.skyColor;

    final child = MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: hovered
                  ? accent.withValues(alpha: 0.9)
                  : ColorPallet.white.withValues(alpha: 0.14),
              width: 1.5,
            ),
            color: hovered
                ? accent.withValues(alpha: 0.10)
                : ColorPallet.mainPirpel.withValues(alpha: 0.18),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.22),
                      blurRadius: 18,
                      spreadRadius: 1,
                    )
                  ]
                : [],
          ),
          child: Icon(
            widget.icon,
            size: 20,
            color: ColorPallet.white.withValues(alpha: 0.92),
          ),
        ),
      ),
    );

    if (widget.tooltip == null) return child;

    return Tooltip(message: widget.tooltip!, child: child);
  }
}
