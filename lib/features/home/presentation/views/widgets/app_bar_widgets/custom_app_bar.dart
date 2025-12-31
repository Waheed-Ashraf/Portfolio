import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/features/home/presentation/views/widgets/app_bar_widgets/custom_app_bar_list.dart';

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
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "App logo",
            style: AppStyles.styleBold20(context)
                .copyWith(color: ColorPallet.darkSky),
          ),
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
