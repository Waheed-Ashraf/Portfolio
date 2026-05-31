import 'package:flutter/material.dart';

class ExperienceModel {
  final String company;
  final String role;
  final String period;
  final String location;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final Color accent;
  final String? logoAsset;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.description,
    required this.highlights,
    required this.technologies,
    required this.accent,
    this.logoAsset,
  });
}
