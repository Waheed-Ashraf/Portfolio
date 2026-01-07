import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/service_model.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel model;
  const ServiceCard({super.key, required this.model});

  @override
  State<ServiceCard> createState() => ServiceCardState();
}

class ServiceCardState extends State<ServiceCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final accent = (m.accent ?? ColorPallet.pink);

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: hovered
            ? (Matrix4.identity()..translate(0.0, -4.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: hovered
                ? accent.withValues(alpha: 0.75)
                : ColorPallet.pink.withValues(alpha: 0.35),
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
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.25),
                    blurRadius: 24,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              // glass overlay
              Positioned.fill(
                child: Container(
                  color: ColorPallet.mainPirpel.withValues(alpha: 0.12),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorPallet.mainPirpel.withValues(alpha: 0.35),
                      border: Border.all(
                        color: ColorPallet.white.withValues(alpha: 0.12),
                      ),
                    ),
                    child: Icon(
                      m.icon,
                      color: ColorPallet.white.withValues(alpha: 0.9),
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    m.title,
                    style: AppStyles.styleSemiBold18(context).copyWith(
                      color: ColorPallet.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    m.description,
                    style: AppStyles.styleRegular14(context).copyWith(
                      color: ColorPallet.white.withValues(alpha: 0.78),
                      height: 1.35,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    height: 3,
                    width: hovered ? 56 : 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: accent.withValues(alpha: hovered ? 0.9 : 0.55),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
