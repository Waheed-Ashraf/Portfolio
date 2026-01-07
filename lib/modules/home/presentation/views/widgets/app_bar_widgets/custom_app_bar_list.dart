import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/app_bar_widgets/app_bar_text_button.dart';

class CustomAppBarList extends StatelessWidget {
  const CustomAppBarList({
    super.key,
    required this.onTapAbout,
    required this.onTapEducation,
    required this.onTapProjects,
    required this.onTapSkills,
    required this.onTapServices,
    required this.onTapGithub,
  });

  final VoidCallback onTapAbout;
  final VoidCallback onTapEducation;
  final VoidCallback onTapProjects;
  final VoidCallback onTapSkills;
  final VoidCallback onTapServices;
  final VoidCallback onTapGithub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(title: "About Me", onTap: onTapAbout),
        AppBarButton(title: "Education", onTap: onTapEducation),
        AppBarButton(title: "Projects", onTap: onTapProjects),
        AppBarButton(title: "Skills", onTap: onTapSkills),
        AppBarButton(title: "Services", onTap: onTapServices),
        AppBarButton(title: "GitHub", onTap: onTapGithub),
      ],
    );
  }
}
