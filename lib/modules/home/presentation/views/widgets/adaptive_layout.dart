import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/const.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key, required this.mobileLayout, required this.desktopLayout});

  final WidgetBuilder mobileLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < breakPoint) {
        return mobileLayout(context);
      } else {
        return desktopLayout(context);
      }
    });
  }
}
