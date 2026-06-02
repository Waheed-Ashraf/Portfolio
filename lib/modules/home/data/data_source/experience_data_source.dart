import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/experience_model.dart';

const experienceList = <ExperienceModel>[
  ExperienceModel(
    company: "Emerald Egypt Facility Management",
    role: "Flutter Developer",
    period: "2025-03 - Present",
    location: "Remote",
    logoAsset: Assets.emerald,
    description:
        "Led the end-to-end development of the Craftscene mobile application from architecture to production deployment.",
    highlights: [
      "Built secure authentication, social login, biometric auth, encrypted token restoration, Google Maps, RFQ, Job Bank, Blog, Q&A, and Ideas systems.",
      "Applied Clean Architecture and Bloc for scalable state management.",
      "Managed releases on Google Play Store and Apple App Store.",
    ],
    technologies: [
      "Flutter",
      "Bloc",
      "Clean Architecture",
      "CI/CD",
      "Google Maps"
    ],
    accent: ColorPallet.skyColor,
  ),
  ExperienceModel(
    company: "Computer Engine",
    role: "Flutter Developer",
    period: "2024-03 - 2025-03",
    location: "Naser City, Egypt",
    logoAsset: Assets.eEngine,
    description:
        "Contributed to commercial Flutter apps including Form Engine, HR Engine for Employee, and Tawasol.",
    highlights: [
      "Built Form Engine features for AI and speech-to-text data conversion into editable JSON.",
      "Delivered HR Engine attendance flows with GPS tracking and facial recognition.",
      "Developed Tawasol QR-based emergency and lost-items flows with private secure communication.",
    ],
    technologies: [
      "Flutter",
      "Firebase",
      "REST APIs",
      "AI",
      "Speech-to-Text",
      "Face Recognition"
    ],
    accent: ColorPallet.pink,
  ),
  ExperienceModel(
    company: "Freelancer",
    role: "Flutter Developer",
    period: "2023-12 - Present",
    location: "Freelance",
    description:
        "Developed multiple Flutter applications focused on real-time communication, scalable architecture, notifications, and Firebase integrations.",
    highlights: [
      "Built Firebase-backed mobile apps with real-time features and notification flows.",
      "Structured apps around maintainable architecture and reusable UI components.",
      "Delivered responsive Flutter interfaces for mobile and web use cases.",
    ],
    technologies: ["Flutter", "Firebase", "Notifications", "Real-time"],
    accent: ColorPallet.lightPink,
  ),
  ExperienceModel(
    company: "Military Service",
    role: "IT Help Desk",
    period: "2022-10 - 2023-12",
    logoAsset: Assets.elsa3ka,
    location: "Egypt",
    description:
        "Maintained and troubleshot computer systems, hardware, and software to ensure reliable day-to-day operation.",
    highlights: [
      "Handled system, hardware, and software troubleshooting.",
      "Supported computer maintenance and operational reliability.",
      "Built a practical foundation in IT support before focusing on Flutter development.",
    ],
    technologies: ["IT Support", "Hardware", "Software", "Troubleshooting"],
    accent: ColorPallet.darkSky,
  ),
];
