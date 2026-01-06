import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/helpers/download_file.dart';
import 'package:portfolio/core/helpers/launch_whats_app.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/widgets/custom_button.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/about_widgets/social_links_row.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 800; // or < 700

    return Column(
      mainAxisAlignment:
          isCompact ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment:
          isCompact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        FadeInDown(
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment:
                isCompact ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: isCompact
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text("Hi There!", style: AppStyles.styleBold20(context)),
              Text("It's Waheed Ashraf,",
                  style: AppStyles.styleBold20(context)),

              const SizedBox(height: 8),

              // ✅ Replace Row with Wrap to avoid overflow on small screens
              Wrap(
                alignment:
                    isCompact ? WrapAlignment.center : WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 6,
                runSpacing: 6,
                children: [
                  Text("I'm a", style: AppStyles.styleBold20(context)),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Software Engineer,',
                        textStyle: AppStyles.styleBold20(context)
                            .copyWith(color: ColorPallet.skyColor),
                      ),
                      TyperAnimatedText(
                        'Flutter Developer,',
                        textStyle: AppStyles.styleBold20(context)
                            .copyWith(color: ColorPallet.skyColor),
                      ),
                      TyperAnimatedText(
                        'Mobile App Developer,',
                        textStyle: AppStyles.styleBold20(context)
                            .copyWith(color: ColorPallet.skyColor),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                "Excited to connect with like-minded professionals, potential collaborators, and anyone interested in my work. Whether you have a question about one of my projects, want to discuss potential opportunities, or just want to say hello, feel free to reach out. Your feedback and inquiries are always welcome.",
                textAlign: isCompact ? TextAlign.center : TextAlign.start,
                style: AppStyles.styleBold16(context)
                    .copyWith(color: ColorPallet.darkSky),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        //  Buttons: on small screens -> Column, otherwise Row
        LayoutBuilder(
          builder: (context, c) {
            final stackButtons = c.maxWidth < 420;
            return stackButtons
                ? Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FadeInLeft(
                          duration: const Duration(seconds: 1),
                          child: ValorantButton(
                            label: "DOWNLOAD CV",
                            variant: ValorantButtonVariant.filled,
                            accent: ColorPallet.pink,
                            onTap: () => downloadCV(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: FadeInRight(
                          duration: const Duration(seconds: 1),
                          child: ValorantButton(
                            label: "LET'S TALK",
                            variant: ValorantButtonVariant.outline,
                            accent: ColorPallet.pink,
                            onTap: () => launchWhatsApp(context),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: FadeInLeft(
                            duration: const Duration(seconds: 1),
                            child: ValorantButton(
                              label: "DOWNLOAD CV",
                              variant: ValorantButtonVariant.filled,
                              accent: ColorPallet.pink,
                              onTap: () => downloadCV(context),
                            )),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: FadeInRight(
                            duration: const Duration(seconds: 1),
                            child: ValorantButton(
                              label: "LET'S TALK",
                              variant: ValorantButtonVariant.outline,
                              accent: ColorPallet.pink,
                              onTap: () => launchWhatsApp(context),
                            )),
                      ),
                    ],
                  );
          },
        ),

        const SizedBox(height: 20),
        FadeInUpBig(
            duration: const Duration(seconds: 2),
            child: SocialLinksRow(isCompact: isCompact)),
      ],
    );
  }
}
