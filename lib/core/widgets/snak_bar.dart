import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

void showSnackBar(BuildContext context,
    {required Color color, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      // width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      duration: const Duration(seconds: 2),
      content: Center(
        child: Text(
          message,
          style: AppStyles.styleBold14(context)
              .copyWith(color: ColorPallet.darkSky),
        ),
      ),
      backgroundColor: color,
    ),
  );
}
