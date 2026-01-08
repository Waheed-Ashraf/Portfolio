import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/about_widgets/about_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/education_and_courses_section/education_and_courses_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/footer_section/footer.section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/github_achievments/git_hub_achievments.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/projects_section/project_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/services_section/services_section.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/skilles_section/skilles_section.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({
    super.key,
    required this.onSectionKeysReady,
  });

  /// We pass keys to HomeView so Drawer can scroll the same page.
  final void Function(MobileSectionKeys keys) onSectionKeysReady;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final ScrollController _scrollController = ScrollController();

  // Section keys
  final _aboutKey = GlobalKey();
  final _eduKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _githubKey = GlobalKey();
  final _footerKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // expose keys + controller to HomeView
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSectionKeysReady(
        MobileSectionKeys(
          scrollController: _scrollController,
          about: _aboutKey,
          education: _eduKey,
          projects: _projectsKey,
          skills: _skillsKey,
          services: _servicesKey,
          github: _githubKey,
          footer: _footerKey,
        ),
      );
    });
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
        SliverToBoxAdapter(key: _aboutKey, child: const AboutSection()),
        SliverToBoxAdapter(
            key: _eduKey, child: const EducationAndCoursesSection()),
        SliverToBoxAdapter(key: _projectsKey, child: const ProjectsSection()),
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
