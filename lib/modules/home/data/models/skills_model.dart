import 'package:flutter/material.dart';

class SkillModel {
  final String title;
  final String imageAsset;
  final Color? accentColor;

  const SkillModel({
    required this.title,
    required this.imageAsset,
    this.accentColor,
  });
}
