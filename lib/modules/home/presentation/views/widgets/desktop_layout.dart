import 'package:flutter/material.dart';

import 'package:portfolio/core/services/portfolio_analytics.dart';
import 'package:portfolio/core/utils/const.dart';

import 'package:portfolio/modules/home/presentation/views/widgets/about_widgets/about_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/education_and_courses_section/education_and_courses_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/experience_section/experience_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/footer_section/footer.section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/github_achievments/git_hub_achievments.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/projects_section/project_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/services_section/services_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/skilles_section/skilles_section.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _eduKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _githubKey = GlobalKey();
  final _footerKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key, String sectionName) async {
    await PortfolioAnalytics.logSectionOpen(sectionName);
    if (!mounted) return;

    final ctx = key.currentContext;
    if (ctx == null) return;
    if (!ctx.mounted) return;

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: CustomAppBar(
              onTapAbout: () => _scrollTo(_aboutKey, 'about'),
              onTapEducation: () => _scrollTo(_eduKey, 'education'),
              onTapExperience: () => _scrollTo(_experienceKey, 'experience'),
              onTapProjects: () => _scrollTo(_projectsKey, 'projects'),
              onTapSkills: () => _scrollTo(_skillsKey, 'skills'),
              onTapServices: () => _scrollTo(_servicesKey, 'services'),
              onTapGithub: () => _scrollTo(_githubKey, 'github'),
            ),
          ),
        ),
        SliverToBoxAdapter(key: _aboutKey, child: const AboutSection()),
        SliverToBoxAdapter(
            key: _experienceKey, child: const ExperienceSection()),
        SliverToBoxAdapter(key: _projectsKey, child: const ProjectsSection()),
        SliverToBoxAdapter(
            key: _eduKey, child: const EducationAndCoursesSection()),
        SliverToBoxAdapter(key: _skillsKey, child: const SkillsSection()),
        SliverToBoxAdapter(key: _servicesKey, child: const ServicesSection()),
        SliverToBoxAdapter(
          key: _githubKey,
          child: const GithubActivitySection(githubUsername: githubUsername),
        ),
        SliverToBoxAdapter(key: _footerKey, child: const FooterSection()),
      ],
    );
  }
}
