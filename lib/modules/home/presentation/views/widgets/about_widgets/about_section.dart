import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/about_widgets/about_me_text.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/about_widgets/profile_image.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return LayoutBuilder(
      builder: (context, c) {
        final isSmall = c.maxWidth < 800;

        return Container(
          constraints: BoxConstraints(minHeight: isSmall ? 0 : h),
          padding: EdgeInsets.symmetric(
            horizontal: isSmall ? 16 : 0,
          ),
          child: isSmall ? const _AboutMobile() : const _AboutDesktop(),
        );
      },
    );
  }
}

class _AboutDesktop extends StatelessWidget {
  const _AboutDesktop();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: SizedBox(width: 8)),
        Expanded(flex: 12, child: Center(child: AboutText())),
        Expanded(flex: 14, child: Center(child: HomeProfileImageWidget())),
      ],
    );
  }
}

class _AboutMobile extends StatelessWidget {
  const _AboutMobile();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: HomeProfileImageWidget()),
        SizedBox(height: 20),
        AboutText(),
      ],
    );
  }
}
