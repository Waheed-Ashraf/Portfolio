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
const String phoneNumber = '201095994970';
const String message = 'Hello, I am interested in your work!';
final String whatsappUrlMobile =
    'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';
final String whatsappUrlWeb =
    'https://api.whatsapp.com/send/?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';
const String cvUrl =
    'https://drive.google.com/uc?export=download&id=1eD_WE-uRSn-YXKv4KLl_9FVWIt_wQCuZ';
