import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.color = ColorPallet.mainPirpel,
      this.withBorder = false,
      required this.onPressed,
      required this.widget});
  final Widget widget;
  final String text;
  final Color? color;
  final bool withBorder;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: MaterialButton(
        color: color,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: withBorder
                ? const BorderSide(color: ColorPallet.pink, width: 2)
                : BorderSide.none),
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.styleBold14(context).copyWith(
                color: color == ColorPallet.mainPirpel
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
