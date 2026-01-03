import 'package:portfolio/core/utils/app_images.dart';

class EducationAndCoursesModel {
  String title;
  String subtitle;
  String certificateImage;
  EducationAndCoursesModel({
    required this.title,
    required this.subtitle,
    required this.certificateImage,
  });
}

List<EducationAndCoursesModel> educationAndCoursesList = [
  EducationAndCoursesModel(
      title: "Bachelor's degree in computer science",
      subtitle: "Menuf University",
      certificateImage: Assets.csCertificate),
  EducationAndCoursesModel(
      title: "Software development - Mobile app development",
      subtitle: "DEPI",
      certificateImage: Assets.depiCert),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
  EducationAndCoursesModel(
      title: "Flutter & Dart Development Course",
      subtitle: "Udemy",
      certificateImage: Assets.completeFlutterCourse),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
  EducationAndCoursesModel(
      title: "Flutter Advanced Course Bloc & MVVM Pattern",
      subtitle: "Udemy",
      certificateImage: Assets.flutterAdvancedCourse),
  EducationAndCoursesModel(
      title: "Mastering Flutter Responsive Adaptive UI Design",
      subtitle: "Udemy",
      certificateImage: Assets.masteringFlutterResponsiveAdaptiveUIDesign),
];
