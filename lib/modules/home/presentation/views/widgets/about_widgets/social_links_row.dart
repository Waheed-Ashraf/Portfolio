import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/modules/home/data/models/social_link_model.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/about_widgets/social_icon_button.dart';

class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({super.key, required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: isCompact ? WrapAlignment.center : WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: socialLinks.map((item) {
        return SocialIconButton(
          socialLogo: item.socialLogo,
          tooltip: item.tooltip,
          accent: item.accent,
          onTap: () => launchCustomUr(context: context, url: item.url),
        );
      }).toList(),
    );
  }
}
