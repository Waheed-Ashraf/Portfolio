import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/features/home/data/models/app_bar_item_model.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    required this.isActive,
    super.key,
    required this.appBarItemModel,
  });
  final bool isActive;
  final AppBarItemModel appBarItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            child: SizedBox(
          height: 4,
        )),
        Text(
          appBarItemModel.itemName,
          style: isActive
              ? AppStyles.styleBold16(context)
              : AppStyles.styleSemiBold16(context)
                  .copyWith(color: ColorPallet.darkSky),
        ),
        const Expanded(
            child: SizedBox(
          height: 4,
        )),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          height: 3.27,
          width: isActive ? 35 : 0,
          color: ColorPallet.darkSky,
        ),
      ],
    );
  }
}
