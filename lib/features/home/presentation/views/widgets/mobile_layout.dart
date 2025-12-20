import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/views/widgets/about_widgets/about_section.dart';
import 'package:portfolio/features/home/presentation/views/widgets/education_and_courses_section/education_and_courses_section.dart';
import 'package:portfolio/features/home/presentation/views/widgets/github_achievments/git_hub_achievments.dart';
import 'package:portfolio/features/home/presentation/views/widgets/projects_section/project_section.dart';
import 'package:portfolio/features/home/presentation/views/widgets/skilles_section/skilles_section.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AboutSection()),
          SliverToBoxAdapter(child: EducationAndCoursesSection()),
          SliverToBoxAdapter(child: ProjectsSection()),
          SliverToBoxAdapter(child: SkillsSection()),
          SliverToBoxAdapter(
            child: GithubActivitySection(githubUsername: "Waheed-Ashraf"),
          )
        ],
      ),
    );
  }
}
