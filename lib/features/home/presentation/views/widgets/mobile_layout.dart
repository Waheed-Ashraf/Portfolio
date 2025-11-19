import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Mobile",
          style: AppStyles.styleMedium20(context),
        ),
      ),
    );
  }
}
