import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/social_link_model.dart';

const socialLinks = <SocialLinkModel>[
  SocialLinkModel(
    socialLogo: Assets.linkedin,
    tooltip: "LinkedIn",
    url: "https://www.linkedin.com/in/waheed-ashraf-18a197214/",
    accent: ColorPallet.skyColor,
  ),
  SocialLinkModel(
    socialLogo: Assets.gitHubLogo,
    tooltip: "GitHub",
    url: "https://github.com/Waheed-Ashraf",
    accent: ColorPallet.white,
  ),
  SocialLinkModel(
    socialLogo: Assets.gmail,
    tooltip: "Email",
    url: "mailto:washraf124@gmail.com",
    accent: ColorPallet.red,
  ),
  SocialLinkModel(
    socialLogo: Assets.instagram,
    tooltip: "Instagram",
    url: "https://www.instagram.com/wa7id_ashraf/",
    accent: ColorPallet.pink,
  ),
  SocialLinkModel(
    socialLogo: Assets.facebook,
    tooltip: "Facebook",
    url: "https://www.facebook.com/waheed.ashraf.1650332",
    accent: ColorPallet.blue,
  ),
];
