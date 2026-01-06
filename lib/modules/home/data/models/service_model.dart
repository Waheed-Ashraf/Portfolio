import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class ServiceModel {
  final String title;
  final String description;
  final IconData icon;
  final Color? accent;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    this.accent,
  });
}

const services = <ServiceModel>[
  ServiceModel(
    title: "Flutter App Development",
    description:
        "Build high-quality cross-platform apps (Android / iOS / Desktop) with modern UI and smooth performance.",
    icon: Icons.phone_iphone_rounded,
    accent: ColorPallet.skyColor,
  ),
  ServiceModel(
    title: "Firebase Integration",
    description:
        "Auth, Firestore, Cloud Messaging (push), analytics-like events, and real-time features.",
    icon: Icons.cloud_rounded,
    accent: ColorPallet.skyColor,
  ),
  ServiceModel(
    title: "Responsive & Adaptive UI",
    description:
        "Pixel-perfect layouts for desktop/tablet/mobile with adaptive components and smooth UX.",
    icon: Icons.dashboard_customize_rounded,
    accent: ColorPallet.lightPink,
  ),
  ServiceModel(
    title: "AI Features in Apps",
    description:
        "Integrations like text recognition, speech/voice recognition, and Google Generative AI workflows.",
    icon: Icons.auto_awesome_rounded,
    accent: ColorPallet.skyColor,
  ),
  ServiceModel(
    title: "REST APIs & Backend Integration",
    description:
        "Robust API integration, error handling, pagination, caching strategies, and secure networking.",
    icon: Icons.api_rounded,
    accent: ColorPallet.darkSky,
  ),
  ServiceModel(
    title: "CI/CD & Store Publishing",
    description:
        "GitHub Actions / Fastlane pipelines and publishing to Google Play, App Store, and Microsoft Store.",
    icon: Icons.rocket_launch_rounded,
    accent: ColorPallet.pink,
  ),
];
