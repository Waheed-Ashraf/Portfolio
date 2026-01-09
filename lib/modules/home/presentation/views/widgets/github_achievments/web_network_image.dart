import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/github_achievments/html_image.dart';

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

    return HtmlImg(url: url, height: height, fit: fit);
  }
}
