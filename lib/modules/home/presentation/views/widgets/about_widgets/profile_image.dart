import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class HomeProfileImageWidget extends StatelessWidget {
  const HomeProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(seconds: 2),
      child: SizedBox(
        height: 400,
        width: 260,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(400),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    height: 280,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorPallet.pink, width: 2),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(410),
                        topLeft: Radius.circular(410),
                      ),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorPallet.mainPirpel,
                            Colors.black,
                            ColorPallet.darkGreen
                          ]),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Image.asset(
                  Assets.profileAnimatedImage3,
                  fit: BoxFit.fitHeight,
                )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    height: 280,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(410),
                          topLeft: Radius.circular(410),
                        ),
                        border: Border(
                          bottom: BorderSide(
                            color: ColorPallet.pink,
                            width: 2.0,
                          ),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
