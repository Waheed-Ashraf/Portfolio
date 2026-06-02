import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/size_config.dart';
import 'package:portfolio/modules/home/data/data_source/experience_data_source.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/experience_section/experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Experience",
                    style: AppStyles.styleSemiBold24(context).copyWith(
                      color: ColorPallet.white,
                      shadows: AppStyles.sectionTitleShadow(),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: ColorPallet.skyColor.withValues(alpha: 0.35),
                    ),
                    color: ColorPallet.skyColor.withValues(alpha: 0.08),
                  ),
                  child: Text(
                    "${experienceList.length} roles",
                    style: AppStyles.styleRegular12(context).copyWith(
                      color: ColorPallet.white.withValues(alpha: 0.80),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isHorizontal = constraints.maxWidth > SizeConfig.tablet;

                if (isHorizontal) {
                  return ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.trackpad,
                      },
                      scrollbars: false,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var index = 0;
                              index < experienceList.length;
                              index++)
                            ExperienceHorizontalItem(
                              model: experienceList[index],
                              index: index,
                              isLast: index == experienceList.length - 1,
                            ),
                        ],
                      ),
                    ),
                  );
                }

                return ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 980),
                  child: Column(
                    children: [
                      for (var index = 0;
                          index < experienceList.length;
                          index++)
                        ExperienceItem(
                          model: experienceList[index],
                          index: index,
                          isLast: index == experienceList.length - 1,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
