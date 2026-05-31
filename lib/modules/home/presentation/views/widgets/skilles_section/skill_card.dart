import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/skills_model.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({super.key, required this.model});

  final SkillModel model;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.model.accentColor ?? ColorPallet.skyColor;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isHovered
              ? ColorPallet.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.16),
          border: Border.all(
            color: isHovered
                ? accent.withValues(alpha: 0.55)
                : ColorPallet.white.withValues(alpha: 0.10),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: accent.withValues(alpha: 0.10),
              ),
              child: SvgPicture.asset(
                widget.model.imageAsset,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold16(context).copyWith(
                  color: ColorPallet.white.withValues(alpha: 0.88),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: isHovered ? 0.95 : 0.55),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
