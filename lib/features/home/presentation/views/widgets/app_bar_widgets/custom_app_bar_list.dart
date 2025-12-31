import 'package:flutter/material.dart';
import 'package:portfolio/features/home/data/models/app_bar_item_model.dart';
import 'package:portfolio/features/home/presentation/views/widgets/app_bar_widgets/app_bar_text_button.dart';

class CustomAppBarList extends StatefulWidget {
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
  State<CustomAppBarList> createState() => _CustomAppBarListState();
}

class _CustomAppBarListState extends State<CustomAppBarList> {
  late final List<AppBarItemModel> appBarData;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    appBarData = [
      AppBarItemModel(itemName: "About Me", onTap: widget.onTapAbout),
      AppBarItemModel(
          itemName: "Education & Certifications", onTap: widget.onTapEducation),
      AppBarItemModel(itemName: "Projects", onTap: widget.onTapProjects),
      AppBarItemModel(itemName: "Skills", onTap: widget.onTapSkills),
      AppBarItemModel(itemName: "Services", onTap: widget.onTapServices),
      AppBarItemModel(itemName: "GitHub", onTap: widget.onTapGithub),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: appBarData.asMap().entries.map((e) {
        final index = e.key;
        final item = e.value;

        return GestureDetector(
          onTap: () {
            if (currentIndex != index) {
              setState(() => currentIndex = index);
            }
            item.onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppBarButton(
              isActive: currentIndex == index,
              appBarItemModel: item,
            ),
          ),
        );
      }).toList(),
    );
  }
}
