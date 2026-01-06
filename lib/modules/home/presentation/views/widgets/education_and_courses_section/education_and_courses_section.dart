import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/education_and_courses_model.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/education_and_courses_section/education_card.dart';

class EducationAndCoursesSection extends StatelessWidget {
  const EducationAndCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Education & Courses",
              style: AppStyles.styleSectionTitle(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 320,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: educationAndCoursesList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 320,
                    child: EducationCard(model: educationAndCoursesList[index]),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
