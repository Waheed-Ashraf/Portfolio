import 'package:portfolio/core/utils/app_images.dart';

class AchievementModel {
  final String title;
  final String imageAsset;
  final String? url;

  const AchievementModel({
    required this.title,
    required this.imageAsset,
    this.url,
  });
}

const achievements = <AchievementModel>[
  AchievementModel(
    title: "Pair Extraordinaire",
    imageAsset: Assets.pairExtraordinaire,
    url: "https://github.com/Waheed-Ashraf",
  ),
  AchievementModel(
    title: "Pull Shark",
    imageAsset: Assets.pullShark,
    url: "https://github.com/Waheed-Ashraf",
  ),
  AchievementModel(
    title: "YOLO",
    imageAsset: Assets.yoloBadge,
    url: "https://github.com/Waheed-Ashraf",
  ),
  AchievementModel(
    title: "Quickdraw",
    imageAsset: Assets.quickDrawSkinTone1,
    url: "https://github.com/Waheed-Ashraf",
  ),
];
