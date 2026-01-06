import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/modules/home/data/models/project_model.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/projects_section/link_button.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/projects_section/tag_chip.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel model;
  const ProjectCard({super.key, required this.model});

  @override
  State<ProjectCard> createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final model = widget.model;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 260),
          offset: isHovered ? const Offset(0, -0.02) : Offset.zero,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: ColorPallet.pink.withValues(alpha: 0.55),
                width: 2,
              ),
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
                        color: ColorPallet.pink.withValues(alpha: 0.35),
                        blurRadius: 28,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Column(
                children: [
                  // Image
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(model.imageAsset,
                              fit: BoxFit.contain),
                        ),
                        // subtle overlay for readability
                        Container(color: Colors.black.withValues(alpha: 0.25)),
                      ],
                    ),
                  ),

                  // Content
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                    color: Colors.black.withValues(alpha: 0.45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                model.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Tags
                              if (model.tags.isNotEmpty) ...[
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: model.tags
                                      .map((t) => TagChip(text: t))
                                      .toList(),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ],
                          ),
                        ),

                        // Links row
                        if (model.links.isNotEmpty)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: model.links.map((link) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 4),
                                  child: LinkButton(
                                    icon: link.icon,
                                    label: link.label,
                                    onTap: () => launchCustomUr(
                                        context: context, url: link.url),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
