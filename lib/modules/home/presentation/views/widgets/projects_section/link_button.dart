import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class LinkButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const LinkButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<LinkButton> createState() => LinkButtonState();
}

class LinkButtonState extends State<LinkButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: hovered
                  ? ColorPallet.pink.withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.2),
            ),
            color: hovered
                ? ColorPallet.pink.withValues(alpha: 0.12)
                : Colors.black.withValues(alpha: 0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 18, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
