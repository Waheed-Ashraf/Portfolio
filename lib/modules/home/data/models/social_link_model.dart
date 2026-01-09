import 'package:flutter/material.dart';

class SocialLinkModel {
  final String socialLogo;
  final String tooltip;
  final String url;
  final Color? accent;

  const SocialLinkModel({
    required this.socialLogo,
    required this.tooltip,
    required this.url,
    this.accent,
  });
}
