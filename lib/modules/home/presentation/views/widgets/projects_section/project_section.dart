import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/data_source/projects_data_source.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/projects_section/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
              "Projects",
              style: AppStyles.styleSemiBold24(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 380,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 20, right: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: projectsList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 18),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 320,
                    child: ProjectCard(model: projectsList[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
