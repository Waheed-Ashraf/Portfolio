import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/home/presentation/views/widgets/app_bar_widgets/custom_app_bar_list.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPallet.mainPirpel,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "App logo",
              style: AppStyles.styleBold20(context)
                  .copyWith(color: ColorPallet.darkSky),
            ),
            const Expanded(
                child: SizedBox(
              width: 8,
            )),
            const CustomAppBarList(),
            const Expanded(
                child: SizedBox(
              width: 8,
            ))
          ],
        ),
      ),
    );
  }
}
