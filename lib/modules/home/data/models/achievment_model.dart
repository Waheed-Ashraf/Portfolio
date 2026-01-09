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
