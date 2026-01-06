import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/education_and_courses_model.dart';

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
            padding: EdgeInsets.only(left: 40.0),
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
                    child:
                        _EducationCard(model: educationAndCoursesList[index]),
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

class _EducationCard extends StatefulWidget {
  final EducationAndCoursesModel model;

  const _EducationCard({required this.model});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: isHovered ? Matrix4.identity() : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: ColorPallet.pink.withValues(alpha: 0.6), width: 2),
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
                      color: ColorPallet.pink.withValues(alpha: 0.4),
                      blurRadius: 25,
                      spreadRadius: 1,
                    )
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                // Certificate Image
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.model.certificateImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Title + Subtitle
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  color: Colors.black.withValues(alpha: 0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.model.subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: ColorPallet.pink,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
