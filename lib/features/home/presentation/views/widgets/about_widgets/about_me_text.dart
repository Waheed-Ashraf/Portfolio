import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/core/widgets/custom_button.dart';
import 'package:portfolio/core/widgets/grediant_button.dart';
import 'package:portfolio/core/widgets/snak_bar.dart';
import 'package:portfolio/features/home/presentation/views/widgets/about_widgets/social_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io' as io;
import 'package:universal_html/html.dart' as html;

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
            Expanded(
              child: ValorantButton(
                label: "DOWNLOAD CV",
                variant: ValorantButtonVariant.filled,
                accent: ColorPallet.pink, // red/pink like screenshot
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
        ),

        const SizedBox(
          height: 24,
        ),
        // Social row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIconButton(
              icon: Icons.linked_camera, // change to proper icons if you want
              tooltip: "LinkedIn",
              accent: ColorPallet.skyColor,
              onTap: () => launchCustomUr(
                  context: context,
                  url: "https://www.linkedin.com/in/your-link"),
            ),
            const SizedBox(width: 10),
            SocialIconButton(
              icon: Icons.code,
              tooltip: "GitHub",
              accent: ColorPallet.white,
              onTap: () => launchCustomUr(
                  context: context, url: "https://github.com/Waheed-Ashraf"),
            ),
            const SizedBox(width: 10),
            SocialIconButton(
              icon: Icons.alternate_email,
              tooltip: "Email",
              accent: ColorPallet.pink,
              onTap: () => launchCustomUr(
                  context: context, url: "mailto:washraf124@gmail.com"),
            ),
            const SizedBox(width: 10),
            SocialIconButton(
              icon: Icons.language,
              tooltip: "Portfolio / Website",
              accent: ColorPallet.darkSky,
              onTap: () => launchCustomUr(
                  context: context, url: "https://your-website.com"),
            ),
          ],
        ),
      ],
    );
  }

  final String cvUrl =
      'https://drive.google.com/uc?export=download&id=1eD_WE-uRSn-YXKv4KLl_9FVWIt_wQCuZ';

  Future<void> _downloadCV(BuildContext context) async {
    try {
      if (!kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS)) {
        // Mobile platforms
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/your-cv.pdf';
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
    const String phoneNumber = '201095994970';
    const String message = 'Hello, I am interested in your work!';
    final String whatsappUrlMobile =
        'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';
    final String whatsappUrlWeb =
        'https://api.whatsapp.com/send/?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';

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
