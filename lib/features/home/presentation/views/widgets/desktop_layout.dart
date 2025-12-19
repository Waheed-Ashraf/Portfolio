import 'package:flutter/material.dart';

import 'package:portfolio/features/home/presentation/views/widgets/about_widgets/about_section.dart';
import 'package:portfolio/features/home/presentation/views/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:portfolio/features/home/presentation/views/widgets/education_and_courses_section/education_and_courses_section.dart';
import 'package:portfolio/features/home/presentation/views/widgets/projects_section/project_section.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomAppBar(),
            ),
          ),
          SliverToBoxAdapter(child: AboutSection()),
          SliverToBoxAdapter(child: EducationAndCoursesSection()),
          SliverToBoxAdapter(child: ProjectsSection()),
        ],
      ),
    );
  }
}
