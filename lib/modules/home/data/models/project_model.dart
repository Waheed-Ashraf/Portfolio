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
        "A construction marketplace platform enabling RFQ/RFP flows, idea exploration, supplier discovery, and project management across multiple languages.",
    tags: ["Flutter", "Bloc", "Clean Architecture"],
    links: [
      ProjectLink(
        type: ProjectLinkType.googlePlay,
        url: "https://play.google.com/store/apps/details?id=com.app.craftscene",
      ),
      ProjectLink(
        type: ProjectLinkType.appStore,
        url:
            "https://apps.apple.com/eg/app/%D9%83%D8%B1%D8%A7%D9%81%D8%AA-%D8%B3%D9%8A%D9%86/id6738144005?l=en",
      ),
      ProjectLink(
        type: ProjectLinkType.website,
        url: "https://www.craftsceneapp.com/",
      ),
    ],
  ),
  ProjectModel(
    title: "Form Engine",
    imageAsset: Assets.doceEngineLogo,
    description:
        "Cross-platform data management app with AI and speech-to-text capabilities, converting unstructured input into editable JSON.",
    tags: [
      "Flutter",
      "Vertex AI",
      "Speech-to-Text",
    ],
    links: [
      ProjectLink(
        type: ProjectLinkType.microsoftStore,
        url:
            "https://apps.microsoft.com/detail/9p5hfd2txs6s?hl=en-us&gl=US&ocid=pdpshare",
      ),
      ProjectLink(
        type: ProjectLinkType.googlePlay,
        url:
            "https://play.google.com/store/apps/details?id=alfacuredashboard.computerengine.net&pli=1",
      ),
    ],
  ),
  ProjectModel(
    title: "HR Engine for Employee",
    imageAsset: Assets.hrEngineForEmployeeLogo,
    description:
        "Employee attendance and HR tracking app featuring GPS-based check-in and facial recognition.",
    tags: ["Flutter", "Firebase", "Face Recognition"],
    links: [
      ProjectLink(
        type: ProjectLinkType.googlePlay,
        url:
            "https://play.google.com/store/apps/details?id=net.computerengine.hratt",
      ),
      ProjectLink(
        type: ProjectLinkType.appStore,
        url: "https://apps.apple.com/us/app/hrengine-for-employee/id6478938298",
      ),
    ],
  ),
  ProjectModel(
    title: "Tawasol",
    imageAsset: Assets.twassolLogo,
    description:
        "Emergency & lost-items solution using secure QR codes to connect users while preserving privacy via a web-based chat interface.",
    tags: [
      "Flutter",
      "QR Codes",
      "Web Chat",
    ],
    links: [
      ProjectLink(
        type: ProjectLinkType.googlePlay,
        url:
            "https://play.google.com/store/apps/details?id=com.tawasolsolutions.coEngine",
      ),
      ProjectLink(
        type: ProjectLinkType.appStore,
        url: "https://apps.apple.com/eg/app/tawasol-solutions/id6478809835",
      ),
    ],
  ),
  ProjectModel(
    title: "CookIt",
    imageAsset: Assets.cookItLogo,
    description:
        "Recipe and cooking assistant app developed using Flutter with Firebase backend and clean architecture.",
    tags: ["Flutter", "Firebase", "Cubit"],
    links: [
      ProjectLink(
        type: ProjectLinkType.github,
        url: "https://github.com/Waheed-Ashraf/CookIt-App",
      ),
    ],
  ),
  ProjectModel(
    title: "Pets App",
    imageAsset: Assets.petsAppLogo,
    description:
        "Pet management and discovery app with user profiles and real-time updates.",
    tags: ["Flutter", "Firestore", "Notifications"],
    links: [
      ProjectLink(
        type: ProjectLinkType.github,
        url: "https://github.com/Waheed-Ashraf/pets-app",
      ),
    ],
  ),
];
