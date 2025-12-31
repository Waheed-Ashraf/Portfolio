import 'package:flutter/material.dart';

class MobileSectionKeys {
  final ScrollController scrollController;
  final GlobalKey about;
  final GlobalKey education;
  final GlobalKey projects;
  final GlobalKey skills;
  final GlobalKey services;
  final GlobalKey github;
  final GlobalKey footer;

  MobileSectionKeys({
    required this.scrollController,
    required this.about,
    required this.education,
    required this.projects,
    required this.skills,
    required this.services,
    required this.github,
    required this.footer,
  });
}

const String githubUsername = "Waheed-Ashraf";
