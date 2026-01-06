import 'package:flutter/material.dart';

import 'package:portfolio/modules/home/presentation/views/widgets/app_bar_widgets/app_logo.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/app_bar_widgets/custom_app_bar_list.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
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
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 24,
        left: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(),
          const Expanded(child: SizedBox(width: 8)),
          CustomAppBarList(
            onTapAbout: onTapAbout,
            onTapEducation: onTapEducation,
            onTapProjects: onTapProjects,
            onTapSkills: onTapSkills,
            onTapServices: onTapServices,
            onTapGithub: onTapGithub,
          ),
          const Expanded(child: SizedBox(width: 8)),
        ],
      ),
    );
  }
}
