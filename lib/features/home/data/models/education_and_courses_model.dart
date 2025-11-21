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
      title: "Software development - Mobile app development",
      subtitle: "DEPI",
      certificateImage: Assets.depiCert),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
  EducationAndCoursesModel(
      title: "Flutter Clean Architecture",
      subtitle: "Udemy",
      certificateImage: Assets.cleanArch),
];
