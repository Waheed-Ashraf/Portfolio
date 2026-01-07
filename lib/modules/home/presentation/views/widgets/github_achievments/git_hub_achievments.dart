import 'dart:math' as math;
import 'dart:ui';
import 'dart:ui_web';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/core/utils/launch_url.dart';
import 'package:portfolio/modules/home/data/models/achievment_model.dart';
import 'package:universal_html/html.dart' as html;

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
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "GitHub Achievements & Activity",
              style: AppStyles.styleSectionTitle(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -----------------------
                  // Contributions
                  // -----------------------
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
                            // Desktop/tablet -> center it nicely
                            return const Align(
                              alignment: Alignment.center,
                              child: graph,
                            );
                          }

                          // Mobile -> scroll horizontally instead of shrinking
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

                  // -----------------------
                  // Achievements
                  Text(
                    "Achievements",
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: ColorPallet.white.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 14),

                  (MediaQuery.widthOf(context) >= 800)
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
                                  child: _AchievementCard(model: a),
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
                                  child: _AchievementCard(model: a),
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

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: ColorPallet.pink.withValues(alpha: 0.45),
          width: 2,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorPallet.mainPirpel,
            ColorPallet.darkGreen,
            ColorPallet.mainPirpel,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: ColorPallet.pink.withValues(alpha: 0.18),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Web-safe image loader:
/// - Web: uses HtmlElementView(<img>) to bypass XHR/CORS issues (SVG + PNG work).
/// - Non-web: uses Image.network normally.
class WebSafeNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? height;

  const WebSafeNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.contain,
    this.height,
  });

  bool get _isSvg =>
      url.toLowerCase().contains('.svg') || url.contains("ghchart");

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      if (_isSvg) {
        return Center(
          child: Text(
            "SVG preview is supported on Web",
            style: AppStyles.styleRegular12(context).copyWith(
              color: ColorPallet.white.withValues(alpha: 0.7),
            ),
          ),
        );
      }

      return Image.network(
        url,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            "Failed to load",
            style: AppStyles.styleRegular12(context).copyWith(
              color: ColorPallet.white.withValues(alpha: 0.7),
            ),
          ),
        ),
      );
    }

    return _HtmlImg(url: url, height: height, fit: fit);
  }
}

class _HtmlImg extends StatefulWidget {
  final String url;
  final double? height;
  final BoxFit fit;

  const _HtmlImg({
    required this.url,
    this.height,
    required this.fit,
  });

  @override
  State<_HtmlImg> createState() => _HtmlImgState();
}

class _HtmlImgState extends State<_HtmlImg> {
  late final String _viewType;
  bool _loaded = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();

    _viewType =
        'img-${widget.url.hashCode}-${DateTime.now().millisecondsSinceEpoch}';

    platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final img = html.ImageElement()
        ..src = widget.url
        ..style.width = '100%'
        ..style.height = widget.height == null ? '100%' : '${widget.height}px'
        ..style.objectFit = _toCssObjectFit(widget.fit);

      img.onLoad.listen((_) {
        if (mounted) setState(() => _loaded = true);
      });
      img.onError.listen((_) {
        if (mounted) setState(() => _failed = true);
      });

      return img;
    });
  }

  String _toCssObjectFit(BoxFit fit) {
    switch (fit) {
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fill:
        return 'fill';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scale-down';
      case BoxFit.fitHeight:
      case BoxFit.fitWidth:
      case BoxFit.contain:
        return 'contain';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: double.infinity,
          child: HtmlElementView(viewType: _viewType),
        ),
        if (!_loaded && !_failed)
          const Positioned.fill(
            child: Center(child: CircularProgressIndicator()),
          ),
        if (_failed)
          Positioned.fill(
            child: Center(
              child: Text(
                "Failed to load",
                style: AppStyles.styleRegular12(context).copyWith(
                  color: ColorPallet.white.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _AchievementCard extends StatefulWidget {
  final AchievementModel model;
  const _AchievementCard({required this.model});

  @override
  State<_AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<_AchievementCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: hovered
                ? ColorPallet.pink.withValues(alpha: 0.85)
                : ColorPallet.pink.withValues(alpha: 0.45),
            width: 2,
          ),
          color: ColorPallet.mainPirpel.withValues(alpha: 0.18),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: ColorPallet.pink.withValues(alpha: 0.25),
                    blurRadius: 18,
                  )
                ]
              : [],
        ),
        child: Image.asset(m.imageAsset, fit: BoxFit.contain),
      ),
    );
  }
}
