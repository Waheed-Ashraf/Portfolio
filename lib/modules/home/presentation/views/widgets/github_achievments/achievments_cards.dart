import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/achievment_model.dart';

class AchievementCard extends StatefulWidget {
  final AchievementModel model;
  const AchievementCard({super.key, required this.model});

  @override
  State<AchievementCard> createState() => AchievementCardState();
}

class AchievementCardState extends State<AchievementCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: hovered
                ? ColorPallet.pink.withValues(alpha: 0.85)
                : ColorPallet.pink.withValues(alpha: 0.45),
            width: 2,
          ),
          color: ColorPallet.mainPirpel.withValues(alpha: 0.18),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: ColorPallet.pink.withValues(alpha: 0.25),
                    blurRadius: 18,
                  )
                ]
              : [],
        ),
        child: Image.asset(m.imageAsset, fit: BoxFit.contain),
      ),
    );
  }
}
