import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/core/widgets/custom_button.dart';
import 'package:portfolio/core/widgets/snak_bar.dart';
import 'package:portfolio/features/home/data/models/social_link_model.dart';
import 'package:portfolio/features/home/presentation/views/widgets/about_widgets/social_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io' as io;
import 'package:universal_html/html.dart' as html;

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 800; // or < 700

    return FadeInUpBig(
      duration: const Duration(seconds: 1),
      child: Column(
        mainAxisAlignment:
            isCompact ? MainAxisAlignment.start : MainAxisAlignment.center,
        crossAxisAlignment:
            isCompact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text("Hi There!", style: AppStyles.styleBold20(context)),
          Text("It's Waheed Ashraf,", style: AppStyles.styleBold20(context)),

          const SizedBox(height: 8),

          // ✅ Replace Row with Wrap to avoid overflow on small screens
          Wrap(
            alignment: isCompact ? WrapAlignment.center : WrapAlignment.start,
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
                          child: ValorantButton(
                            label: "DOWNLOAD CV",
                            variant: ValorantButtonVariant.filled,
                            accent: ColorPallet.pink,
                            onTap: () => _downloadCV(context),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ValorantButton(
                            label: "LET'S TALK",
                            variant: ValorantButtonVariant.outline,
                            accent: ColorPallet.pink,
                            onTap: () => _launchWhatsApp(context),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: ValorantButton(
                            label: "DOWNLOAD CV",
                            variant: ValorantButtonVariant.filled,
                            accent: ColorPallet.pink,
                            onTap: () => _downloadCV(context),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: ValorantButton(
                            label: "LET'S TALK",
                            variant: ValorantButtonVariant.outline,
                            accent: ColorPallet.pink,
                            onTap: () => _launchWhatsApp(context),
                          ),
                        ),
                      ],
                    );
            },
          ),

          const SizedBox(height: 20),
          SocialLinksRow(isCompact: isCompact),
        ],
      ),
    );
  }

  Future<void> _downloadCV(BuildContext context) async {
    try {
      if (!kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS)) {
        // Mobile platforms
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/Waheed-Ashraf-cv.pdf';
        final dio = Dio();
        await dio.download(cvUrl, filePath);

        // File downloaded successfully

        showSnackBar(context,
            color: ColorPallet.mainPirpel, message: "CV downloaded");
      } else if (kIsWeb) {
        // Web platform
        html.AnchorElement anchorElement = html.AnchorElement(href: cvUrl);
        anchorElement.download = "Waheed Ashraf resume";
        anchorElement.click();

        // File downloaded successfully

        showSnackBar(context,
            color: ColorPallet.mainPirpel, message: "CV downloaded");
      } else {
        // Unsupported platform

        showSnackBar(context,
            color: Colors.red, message: "Unsupported plateform");
      }
    } catch (e) {
      // Handle any errors during the download

      showSnackBar(context,
          color: Colors.red, message: "CV downloading Error $e");
    }
  }

  Future<void> _launchWhatsApp(BuildContext context) async {
    try {
      if (kIsWeb) {
        html.window.open(whatsappUrlWeb, 'new tab');
      } else {
        final Uri url = Uri.parse(whatsappUrlMobile);

        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $whatsappUrlMobile';
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error launching WhatsApp: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

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
