import 'package:flutter/material.dart';

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
