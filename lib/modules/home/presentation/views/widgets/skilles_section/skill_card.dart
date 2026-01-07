


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/skills_model.dart';

class SkillCard extends StatefulWidget {
  final SkillModel model;
  const SkillCard({super.key,  required this.model});

  @override
  State<SkillCard> createState() => SkillCardState();
}

class SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final glowColor =
        (m.accentColor ?? ColorPallet.pink).withValues(alpha: 0.35);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 220),
        scale: isHovered ? 1.03 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isHovered
                  ? (m.accentColor ?? ColorPallet.pink).withValues(alpha: 0.8)
                  : ColorPallet.pink.withValues(alpha: 0.45),
              width: 2,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorPallet.mainPirpel,
                Colors.black,
                ColorPallet.darkGreen,
              ],
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: glowColor,
                      blurRadius: 26,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(color: Colors.black.withValues(alpha: 0.15)),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 62,
                        width: 62,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.15)),
                          color: Colors.black.withValues(alpha: 0.25),
                        ),
                        child: SvgPicture.asset(
                          m.imageAsset,
                          fit: BoxFit.contain,
                         ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        m.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        height: 3,
                        width: isHovered ? 44 : 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: (m.accentColor ?? ColorPallet.pink).withValues(
                            alpha: isHovered ? 0.9 : 0.55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
