import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Tablet",
          style: AppStyles.styleMedium20(context),
        ),
      ),
    );
  }
}
