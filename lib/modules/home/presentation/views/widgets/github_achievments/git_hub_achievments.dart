import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/modules/home/data/data_source/achievements_data_source.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/github_achievments/achievments_cards.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/github_achievments/glass_card.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/github_achievments/web_network_image.dart';

class GithubActivitySection extends StatelessWidget {
  const GithubActivitySection({
    super.key,
    required this.githubUsername,
  });

  final String githubUsername;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "GitHub Achievements & Activity",
              style: AppStyles.styleSemiBold24(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Contributions",
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: ColorPallet.white.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      color: ColorPallet.mainPirpel.withValues(alpha: 0.25),
                      child: LayoutBuilder(
                        builder: (context, c) {
                          const double fixedGraphWidth = 720;
                          final bool needsScroll = c.maxWidth < fixedGraphWidth;

                          const graph = SizedBox(
                            width: fixedGraphWidth,
                            height: 170,
                            child: WebSafeNetworkImage(
                              url: graphUrl,
                              height: 170,
                              fit: BoxFit.contain,
                            ),
                          );

                          if (!needsScroll) {
                            return const Align(
                              alignment: Alignment.center,
                              child: graph,
                            );
                          }
                          return ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              dragDevices: {
                                PointerDeviceKind.touch,
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.trackpad,
                              },
                              scrollbars: false,
                            ),
                            child: const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: graph,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "Achievements",
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: ColorPallet.white.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 14),
                  (MediaQuery.widthOf(context) >= breakPoint)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          children: [
                            for (final a in achievements)
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: GestureDetector(
                                  onTap: a.url == null
                                      ? null
                                      : () => launchCustomUr(
                                          context: context, url: a.url!),
                                  child: AchievementCard(model: a),
                                ),
                              ),
                          ],
                        )
                      : Row(
                          spacing: 4,
                          children: [
                            for (final a in achievements)
                              Expanded(
                                child: GestureDetector(
                                  onTap: a.url == null
                                      ? null
                                      : () => launchCustomUr(
                                          context: context, url: a.url!),
                                  child: AchievementCard(model: a),
                                ),
                              ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
