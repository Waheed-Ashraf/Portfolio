import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/data_source/skills_data_source.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/skilles_section/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final columns = width >= 1100
                    ? 5
                    : width >= 820
                        ? 4
                        : width >= 560
                            ? 3
                            : 2;
                const spacing = 12.0;
                final itemWidth = (width - (columns - 1) * spacing) / columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (final skill in skillsList)
                      SizedBox(
                        width: itemWidth,
                        child: SkillCard(model: skill),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
