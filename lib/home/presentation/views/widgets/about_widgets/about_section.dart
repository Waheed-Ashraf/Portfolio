import 'package:flutter/material.dart';

import 'package:portfolio/core/utils/color_pallet.dart';

import 'package:portfolio/home/presentation/views/widgets/about_widgets/about_me_text.dart';
import 'package:portfolio/home/presentation/views/widgets/about_widgets/profile_image.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 55,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            ColorPallet.mainPirpel,
            Colors.black,
            ColorPallet.darkGreen
          ])),
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
