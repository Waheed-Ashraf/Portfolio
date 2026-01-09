import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/const.dart';

class SizeConfig {
  static const double desktop = 1200;
  static const double tablet = breakPoint;

  static late double width, height;

  static init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
