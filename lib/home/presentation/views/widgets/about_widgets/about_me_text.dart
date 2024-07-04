import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/widgets/custom_button.dart';
import 'package:portfolio/core/widgets/grediant_button.dart';

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
            SizedBox(
              height: 40,
              child: GradientButton(
                onPressed: () {
                  _downloadCV(context);
                },
                text: "Download CV",
                icon: Icons.download,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              height: 40,
              child: CustomButton(
                  color: Colors.white,
                  withBorder: true,
                  text: "Let's Talk",
                  onPressed: () {},
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SvgPicture.asset(
                      Assets.whatsAppIcon,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  final String cvUrl =
      'https://drive.google.com/uc?export=download&id=1HM2-CFEf0pc-wOD3FFbwE4NqjJpTyveX';

  Future<void> _downloadCV(BuildContext context) async {
    try {
      if (!kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS)) {
        // Mobile platforms
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/your-cv.pdf';
        final dio = Dio();
        await dio.download(cvUrl, filePath);

        // File downloaded successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('CV downloaded to $filePath'),
            duration: const Duration(seconds: 3),
          ),
        );
      } else if (kIsWeb) {
        // Web platform
        html.AnchorElement anchorElement = html.AnchorElement(href: cvUrl);
        anchorElement.download = "Waheed Ashraf resume";
        anchorElement.click();

        // File downloaded successfully
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CV downloaded'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Unsupported platform
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unsupported platform'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Handle any errors during the download
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error downloading CV: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
