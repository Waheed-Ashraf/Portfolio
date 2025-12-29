import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/features/home/data/models/skills_model.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;
  bool _pause = false;

  static const double _speedPxPerTick = 0.8;
  static const Duration _tick = Duration(milliseconds: 16);
  static const double _resetOffset = 50.0;

  List<SkillModel> get _looped => [...skillsList, ...skillsList];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(_tick, (_) {
      if (!mounted || _pause || !_controller.hasClients) return;

      final max = _controller.position.maxScrollExtent;
      final next = _controller.offset + _speedPxPerTick;

      // When we reach near the end, jump back to the start smoothly (because list is duplicated)
      if (next >= max - _resetOffset) {
        _controller.jumpTo(0);
      } else {
        _controller.jumpTo(next);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              "Skills",
              style: AppStyles.styleSectionTitle(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          MouseRegion(
            onEnter: (_) => setState(() => _pause = true),
            onExit: (_) => setState(() => _pause = false),
            child: SizedBox(
              height: 170,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: ListView.separated(
                  controller: _controller,
                  clipBehavior: Clip.none,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _looped.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) =>
                      _SkillCard(model: _looped[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillModel model;
  const _SkillCard({required this.model});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
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
                          // optional: keep logos readable on dark bg
                          // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
