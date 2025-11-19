import 'package:flutter/material.dart';

import 'package:portfolio/features/home/presentation/views/widgets/about_widgets/about_me_text.dart';
import 'package:portfolio/features/home/presentation/views/widgets/about_widgets/profile_image.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                width: 8,
              )),
          Expanded(flex: 12, child: Center(child: AboutText())),
          Expanded(flex: 14, child: Center(child: HomeProfileImageWidget())),
        ],
      ),
    );
  }
}
