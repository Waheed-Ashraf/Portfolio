import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function() onPressed;
  const GradientButton(
      {required this.text, required this.onPressed, super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    const primaryColor = ColorPallet.mainPirpel;
    const secondaryColor = ColorPallet.darkGreen;

    const double borderRadius = 8;

    return AspectRatio(
      aspectRatio: 4 / 1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const LinearGradient(
                colors: [secondaryColor, primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.only(right: 0, left: 0, top: 8, bottom: 8)),
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppStyles.styleBold14(context),
              ),
              const SizedBox(
                width: 6,
              ),
              Icon(
                icon,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
