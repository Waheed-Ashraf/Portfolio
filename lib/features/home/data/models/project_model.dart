import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_images.dart';

enum ProjectLinkType {
  github,
  googlePlay,
  appStore,
  microsoftStore,
  website,
  demo
}

class ProjectLink {
  final ProjectLinkType type;
  final String url;

  const ProjectLink({required this.type, required this.url});

  IconData get icon {
    switch (type) {
      case ProjectLinkType.github:
        return Icons.code;
      case ProjectLinkType.googlePlay:
        return Icons.android;
      case ProjectLinkType.appStore:
        return Icons.apple;
      case ProjectLinkType.microsoftStore:
        return Icons.window;
      case ProjectLinkType.website:
        return Icons.language;
      case ProjectLinkType.demo:
        return Icons.play_circle;
    }
  }

  String get label {
    switch (type) {
      case ProjectLinkType.github:
        return "GitHub";
      case ProjectLinkType.googlePlay:
        return "Google Play";
      case ProjectLinkType.appStore:
        return "App Store";
      case ProjectLinkType.microsoftStore:
        return "Microsoft Store";
      case ProjectLinkType.website:
        return "Website";
      case ProjectLinkType.demo:
        return "Demo";
    }
  }
}

class ProjectModel {
  final String title;
  final String imageAsset; // or network image later
  final String description;
  final List<String> tags;
  final List<ProjectLink> links;

  const ProjectModel({
    required this.title,
    required this.imageAsset,
    required this.description,
    this.tags = const [],
    this.links = const [],
  });
}

const projectsList = <ProjectModel>[
  ProjectModel(
    title: "CraftScene",
    imageAsset: Assets.craftsceneLogo,
    description:
        "Marketplace & service platform with RFQ/RFP flows, notifications, and dashboards.",
    tags: ["Flutter", "Laravel", "AWS"],
    links: [
      ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              "https://play.google.com/store/apps/details?id=com.app.craftscene"),
      ProjectLink(
          type: ProjectLinkType.appStore,
          url:
              "https://apps.apple.com/eg/app/%D9%83%D8%B1%D8%A7%D9%81%D8%AA-%D8%B3%D9%8A%D9%86/id6738144005?l=en"),
      ProjectLink(
          type: ProjectLinkType.website, url: "https://www.craftsceneapp.com/"),
    ],
  ),
  ProjectModel(
    title: "CraftScene",
    imageAsset: Assets.craftsceneLogo,
    description:
        "Marketplace & service platform with RFQ/RFP flows, notifications, and dashboards.",
    tags: ["Flutter", "Laravel", "AWS"],
    links: [
      ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              "https://play.google.com/store/apps/details?id=com.app.craftscene"),
      ProjectLink(
          type: ProjectLinkType.appStore,
          url:
              "https://apps.apple.com/eg/app/%D9%83%D8%B1%D8%A7%D9%81%D8%AA-%D8%B3%D9%8A%D9%86/id6738144005?l=en"),
      ProjectLink(
          type: ProjectLinkType.website, url: "https://www.craftsceneapp.com/"),
    ],
  ),
  ProjectModel(
    title: "CraftScene",
    imageAsset: Assets.craftsceneLogo,
    description:
        "Marketplace & service platform with RFQ/RFP flows, notifications, and dashboards.",
    tags: ["Flutter", "Laravel", "AWS"],
    links: [
      ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              "https://play.google.com/store/apps/details?id=com.app.craftscene"),
      ProjectLink(
          type: ProjectLinkType.appStore,
          url:
              "https://apps.apple.com/eg/app/%D9%83%D8%B1%D8%A7%D9%81%D8%AA-%D8%B3%D9%8A%D9%86/id6738144005?l=en"),
      ProjectLink(
          type: ProjectLinkType.website, url: "https://www.craftsceneapp.com/"),
    ],
  ),
];
