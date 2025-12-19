import 'dart:ui_web'; // platformViewRegistry (web only)

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:universal_html/html.dart' as html;

class GithubActivitySection extends StatelessWidget {
  const GithubActivitySection({
    super.key,
    required this.githubUsername,
  });

  final String githubUsername;

  @override
  Widget build(BuildContext context) {
    final graphUrl = "https://ghchart.rshah.org/39d353/$githubUsername";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              "GitHub Achievements & Activity",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: _GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -----------------------
                  // Contributions
                  // -----------------------
                  Text(
                    "Contributions",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      color: Colors.black.withValues(alpha: 0.25),
                      child: WebSafeNetworkImage(
                        url: graphUrl, // SVG
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // -----------------------
                  // Achievements
                  // -----------------------
                  Text(
                    "Achievements",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: achievements.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (context, i) {
                        final a = achievements[i];
                        return SizedBox(
                          width: 210,
                          child: _AchievementCard(model: a),
                        );
                      },
                    ),
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
          colors: [ColorPallet.mainPirpel, Colors.black, ColorPallet.darkGreen],
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
/// - Non-web: uses Image.network normally (PNG/JPG best; SVG may not render).
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
      // On non-web: SVG via Image.network won't work.
      // If you ever need this section on mobile/desktop, either:
      // 1) force PNG endpoints, or
      // 2) use flutter_svg with a CORS-safe proxy.
      if (_isSvg) {
        return const Center(
          child: Text(
            "SVG preview is supported on Web",
            style: TextStyle(color: Colors.white70),
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
        errorBuilder: (_, __, ___) => const Center(
          child:
              Text("Failed to load", style: TextStyle(color: Colors.white70)),
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
        ..style.objectFit = _toCssObjectFit(widget.fit)
        ..style.imageRendering = 'pixelated';

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
      default:
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
          const Positioned.fill(
            child: Center(
              child: Text(
                "Failed to load",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
      ],
    );
  }
}

class AchievementModel {
  final String title;
  final String imageAsset; // local asset (svg/png)
  final String? url; // optional link to GitHub profile / repo / certificate

  const AchievementModel({
    required this.title,
    required this.imageAsset,
    this.url,
  });
}

const achievements = <AchievementModel>[
  AchievementModel(
    title: "Arctic Code Vault",
    imageAsset: "assets/achievements/arctic.png",
    url: "https://github.com/Waheed-Ashraf",
  ),
  AchievementModel(
    title: "Pull Shark",
    imageAsset: "assets/achievements/pull_shark.png",
    url: "https://github.com/Waheed-Ashraf",
  ),
];

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
          color: Colors.black.withValues(alpha: 0.25),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: ColorPallet.pink.withValues(alpha: 0.25),
                    blurRadius: 18,
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              height: 54,
              width: 54,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.black.withValues(alpha: 0.25),
                border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              ),
              child: Image.asset(m.imageAsset, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                m.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
