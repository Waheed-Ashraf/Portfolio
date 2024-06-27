import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/widgets/grediant_button.dart';
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
              flex: 3,
              child: SizedBox(
                width: 8,
              )),
          Expanded(flex: 9, child: Center(child: AboutText())),
          Expanded(flex: 12, child: Center(child: HomeProfileImageWidget())),
        ],
      ),
    );
  }
}

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi There!",
          style: AppStyles.styleBold20(context),
        ),
        Text(
          "It's Waheed Ashraf,",
          style: AppStyles.styleBold20(context),
        ),
        Row(
          children: [
            Text(
              "I'm a ",
              style: AppStyles.styleBold20(context),
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText('Software Engineer,',
                    textStyle: AppStyles.styleBold20(context)
                        .copyWith(color: ColorPallet.skyColor)),
                TyperAnimatedText('Flutter Developer,',
                    textStyle: AppStyles.styleBold20(context)
                        .copyWith(color: ColorPallet.skyColor)),
                TyperAnimatedText('Mobile App Developer,',
                    textStyle: AppStyles.styleBold20(context)
                        .copyWith(color: ColorPallet.skyColor)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Excited to connect with like-minded professionals, potential collaborators, and anyone interested in my work. Whether you have a question about one of my projects, want to discuss potential opportunities, or just want to say hello, feel free to reach out. Your feedback and inquiries are always welcome.",
          style: AppStyles.styleBold16(context)
              .copyWith(color: ColorPallet.darkSky),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            GradientButton(
              onPressed: () {},
              text: "Contact Me",
              icon: Icons.download,
            ),
            const SizedBox(
              width: 16,
            ),
            GradientButton(
              onPressed: () {},
              text: "My Rusme",
              icon: Icons.download,
            ),
          ],
        ),
      ],
    );
  }
}
