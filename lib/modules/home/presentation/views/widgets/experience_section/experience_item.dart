import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/experience_model.dart';

class ExperienceItem extends StatefulWidget {
  const ExperienceItem({
    super.key,
    required this.model,
    required this.index,
    required this.isLast,
  });

  final ExperienceModel model;
  final int index;
  final bool isLast;

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.model.accent;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 38,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: isHovered ? accent : Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: accent, width: 2),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.35),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
              ),
              if (!widget.isLast)
                Container(
                  width: 1,
                  height: 170,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: ColorPallet.white.withValues(alpha: 0.12),
                ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 28),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(18),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(model: widget.model, index: widget.index),
                    const SizedBox(height: 12),
                    Text(
                      widget.model.description,
                      style: AppStyles.styleRegular14(context).copyWith(
                        color: ColorPallet.white.withValues(alpha: 0.72),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      widget.model.highlights.first,
                      style: AppStyles.styleRegular14(context).copyWith(
                        color: ColorPallet.white.withValues(alpha: 0.86),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final tech in widget.model.technologies)
                          _TechLabel(label: tech, accent: accent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.model,
    required this.index,
  });

  final ExperienceModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 520;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Mark(model: model, index: index),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.company,
                    style: AppStyles.styleBold16(context).copyWith(
                      color: ColorPallet.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    model.role,
                    style: AppStyles.styleMedium16(context).copyWith(
                      color: model.accent,
                    ),
                  ),
                  if (isCompact) ...[
                    const SizedBox(height: 8),
                    _MetaLine(model: model),
                  ],
                ],
              ),
            ),
            if (!isCompact) ...[
              const SizedBox(width: 12),
              _MetaLine(model: model, alignEnd: true),
            ],
          ],
        );
      },
    );
  }
}

class _MetaLine extends StatelessWidget {
  const _MetaLine({
    required this.model,
    this.alignEnd = false,
  });

  final ExperienceModel model;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          model.period,
          style: AppStyles.styleRegular12(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.76),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          model.location,
          style: AppStyles.styleRegular12(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.48),
          ),
        ),
      ],
    );
  }
}

class _Mark extends StatelessWidget {
  const _Mark({
    required this.model,
    required this.index,
  });

  final ExperienceModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: model.accent.withValues(alpha: 0.50)),
        color: model.accent.withValues(alpha: 0.10),
      ),
      child: model.logoAsset == null
          ? Center(
              child: Text(
                '${index + 1}'.padLeft(2, '0'),
                style: AppStyles.styleBold12(context).copyWith(
                  color: ColorPallet.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(7),
              child: Image.asset(model.logoAsset!, fit: BoxFit.contain),
            ),
    );
  }
}

class _TechLabel extends StatelessWidget {
  const _TechLabel({
    required this.label,
    required this.accent,
  });

  final String label;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppStyles.styleRegular12(context).copyWith(
        color: accent.withValues(alpha: 0.92),
      ),
    );
  }
}
