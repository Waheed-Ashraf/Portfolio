import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/modules/home/data/models/skills_model.dart';

const skillsList = <SkillModel>[
  SkillModel(
      title: "Flutter",
      imageAsset: Assets.flutterLogo,
      accentColor: Colors.lightBlue),
  SkillModel(
      title: "Dart", imageAsset: Assets.dartLogo, accentColor: Colors.blue),
  SkillModel(
      title: "Firebase",
      imageAsset: Assets.firebaseLogo,
      accentColor: Colors.orange),
  SkillModel(
      title: "Google Cloud",
      imageAsset: Assets.googleCloude,
      accentColor: Colors.amber),
  SkillModel(
      title: "Postman",
      imageAsset: Assets.postmanLogo,
      accentColor: Colors.orange),
  SkillModel(
      title: "Insomnia",
      imageAsset: Assets.insomniaLogo,
      accentColor: Colors.deepPurple),
  SkillModel(
      title: "GitHub",
      imageAsset: Assets.gitHubLogo,
      accentColor: Colors.white),
  SkillModel(
      title: "GitHub Actions",
      imageAsset: Assets.gitHubActions,
      accentColor: Colors.green),
  SkillModel(
      title: "Java", imageAsset: Assets.javaLogo, accentColor: Colors.red),
];
