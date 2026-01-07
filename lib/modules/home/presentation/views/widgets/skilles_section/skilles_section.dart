import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/skills_model.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/skilles_section/skill_card.dart';

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
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Skills",
              style: AppStyles.styleSemiBold24(context).copyWith(
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
                      SkillCard(model: _looped[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
