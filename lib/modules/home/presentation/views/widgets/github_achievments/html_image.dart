import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:universal_html/html.dart' as html;

class HtmlImg extends StatefulWidget {
  final String url;
  final double? height;
  final BoxFit fit;

  const HtmlImg({
    super.key,
    required this.url,
    this.height,
    required this.fit,
  });

  @override
  State<HtmlImg> createState() => HtmlImgState();
}

class HtmlImgState extends State<HtmlImg> {
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
